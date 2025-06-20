import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/fetch_skills.dart' show SkillModel;
import '../../provider/update_skill_provider.dart' show updateSkillProvider;

class UpdateSkillConsumerButton extends ConsumerWidget {
  const UpdateSkillConsumerButton({super.key, required this.skill});

  final SkillModel skill;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpdateSkill = ref.watch(updateSkillProvider);
    _updateSkillProviderListener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref.read(updateSkillProvider.notifier).validateAndUpdate(skill);
      },
      text: AppStrings.saveChanges,
      child: asyncUpdateSkill?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _updateSkillProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(updateSkillProvider, (_, current) {
      current?.whenOrNull(
        data: (_) => context.showToast(AppStrings.updateSkillSuccessfully),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }
}
