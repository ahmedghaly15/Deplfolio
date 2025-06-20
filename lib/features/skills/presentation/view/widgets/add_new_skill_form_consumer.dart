import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../provider/add_skill_provider.dart'
    show addSKillNameProvider, addSkillFormKeyProvider, addSkillPercentProvider;

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
          AddSkillPercentSliderConsumer(),
        ],
      ),
    );
  }
}

class AddSkillNameFieldConsumer extends ConsumerWidget {
  const AddSkillNameFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final skillName = ref.watch(addSKillNameProvider);
    return CustomDataInput(
      autofocus: true,
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.name,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        if (value != skillName) {
          ref.read(addSKillNameProvider.notifier).state = value;
        }
      },
    );
  }
}

class AddSkillPercentSliderConsumer extends ConsumerWidget {
  const AddSkillPercentSliderConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillPercent = ref.watch(addSkillPercentProvider);
    return Row(
      spacing: 16.w,
      children: [
        Expanded(
          child: Material(
            child: ShadSlider(
              initialValue: 0.0,
              max: 1.0,
              divisions: 10,
              onChanged: (newValue) {
                if (newValue != ref.read(addSkillPercentProvider)) {
                  ref.read(addSkillPercentProvider.notifier).state = newValue;
                }
              },
            ),
          ),
        ),
        Text(skillPercent.toString(), style: context.shadTextTheme.p),
      ],
    );
  }
}
