import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../provider/delete_skill_provider.dart';

class DeleteSkillConfirmConsumerButton extends ConsumerWidget {
  const DeleteSkillConfirmConsumerButton({super.key, required this.skillId});

  final String skillId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDeleteSkill = ref.watch(deleteSkillProvider);
    _deleteSkillProviderListener(ref, context);
    return PrimaryButton(
      onPressed: () {
        ref.read(deleteSkillProvider.notifier).delete(skillId);
      },
      text: AppStrings.confirm,
      child: asyncDeleteSkill?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _deleteSkillProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(deleteSkillProvider, (_, current) {
      current?.whenOrNull(
        data: (_) => _onSuccess(context),
        error: (error, _) => context.showToast(error.toString()),
      );
    });
  }

  void _onSuccess(BuildContext context) {
    context.pop();
    context.showToast(AppStrings.skillDeletedSuccessfully);
  }
}
