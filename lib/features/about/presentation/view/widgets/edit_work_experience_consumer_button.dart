import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../core/local_data_source/local_data_refresher.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/about.dart' show WorkExperienceModel;
import '../../providers/update_work_experience_provider.dart'
    show updateWorkExperienceProvider;

class EditWorkExperienceConsumerButton extends ConsumerWidget {
  const EditWorkExperienceConsumerButton({
    super.key,
    required this.workExperience,
  });

  final WorkExperienceModel workExperience;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpdateWorkExperience = ref.watch(updateWorkExperienceProvider);
    _updateWorkExperienceProviderListener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref
            .read(updateWorkExperienceProvider.notifier)
            .validateAndUpdate(workExperience);
      },
      text: AppStrings.saveChanges,
      child: asyncUpdateWorkExperience?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _updateWorkExperienceProviderListener(
    WidgetRef ref,
    BuildContext context,
  ) {
    ref.listen(updateWorkExperienceProvider, (_, current) {
      current?.whenOrNull(
        data: (_) {
          LocalDataRefresher.refreshAbout(ref);
          context.showToast(AppStrings.workExperienceUpdatedSuccessfully);
        },
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }
}
