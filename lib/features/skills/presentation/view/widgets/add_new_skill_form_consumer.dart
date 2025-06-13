import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadForm;

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../provider/add_skill_provider.dart'
    show skillNameProvider, addSkillFormKeyProvider;
import '../../provider/update_skill_provider.dart' hide skillNameProvider;

class AddNewSkillFormConsumer extends ConsumerWidget {
  const AddNewSkillFormConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.read(addSkillFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        children: const [
          AddSkillNameFieldConsumer(),
          AddSkillPercentFieldConsumer(),
        ],
      ),
    );
  }
}

class AddSkillPercentFieldConsumer extends ConsumerWidget {
  const AddSkillPercentFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.percent,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        ref.read(skillPercentProvider.notifier).state = value;
      },
    );
  }
}

class AddSkillNameFieldConsumer extends ConsumerWidget {
  const AddSkillNameFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.name,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        ref.read(skillNameProvider.notifier).state = value;
      },
    );
  }
}
