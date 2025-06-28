import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/local_data_source/local_data_refresher.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/about.dart' show ApproachModel;
import '../../providers/update_approach_provider.dart'
    show updateApproachProvider;

class EditApproachConsumerButton extends ConsumerWidget {
  const EditApproachConsumerButton({super.key, required this.approach});

  final ApproachModel approach;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpdateApproach = ref.watch(updateApproachProvider);
    _updateApproachProviderListener(ref, context);
    return PrimaryButton(
      onPressed:
          () => ref
              .read(updateApproachProvider.notifier)
              .validateAndUpdate(approach),
      text: AppStrings.saveChanges,
      child: asyncUpdateApproach?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _updateApproachProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(updateApproachProvider, (_, current) {
      current?.whenOrNull(
        data: (_) {
          LocalDataRefresher.refreshAbout(ref);
          context.showToast(AppStrings.aboutDataUpdateSuccess);
        },
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }
}
