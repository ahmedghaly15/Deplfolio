import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/skills_texts.dart';
import '../../provider/update_skill_header_provider.dart';

class UpdateSkillHeaderConsumerButton extends ConsumerWidget {
  const UpdateSkillHeaderConsumerButton({super.key, required this.skillsText});

  final SkillsTexts skillsText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncConfirm = ref.watch(updateSkillHeaderProvider);
    final isButtonEnabled = ref.watch(
      isUpdateSkillHeaderButtonEnabledProvider(skillsText),
    );
    _updateSkillHeaderProviderListener(ref, context);
    return PrimaryButton(
      expands: true,
      onPressed:
          isButtonEnabled
              ? () {
                ref
                    .read(updateSkillHeaderProvider.notifier)
                    .validateAndUpdate(skillsText);
              }
              : null,
      text: AppStrings.saveChanges,
      child: asyncConfirm?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _updateSkillHeaderProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(updateSkillHeaderProvider, (_, current) {
      current?.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data:
            (_) =>
                context.showToast(AppStrings.skillsHeaderUpdatedSuccessfully),
      );
    });
  }
}
