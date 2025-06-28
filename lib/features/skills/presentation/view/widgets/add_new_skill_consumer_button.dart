import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/local_data_source/local_data_refresher.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../provider/add_skill_provider.dart';

class AddNewSkillConsumerButton extends ConsumerWidget {
  const AddNewSkillConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAddNewSkill = ref.watch(addSkillProvider);
    _addSkillProviderListener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref.read(addSkillProvider.notifier).validateAndAdd();
      },
      text: AppStrings.confirm,
      child: asyncAddNewSkill?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _addSkillProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(addSkillProvider, (_, current) {
      current?.whenOrNull(
        data: (_) => _onSuccess(ref, context),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  void _onSuccess(WidgetRef ref, BuildContext context) {
    LocalDataRefresher.refreshSkills(ref);
    context.pop();
    context.showToast(AppStrings.newSkillAddedSuccessfully);
  }
}
