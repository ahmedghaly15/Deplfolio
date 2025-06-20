import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../../data/models/update_or_add_skill_form_params.dart';

class UpdateOrAddSkillFormConsumer extends ConsumerWidget {
  const UpdateOrAddSkillFormConsumer({super.key, required this.params});

  final UpdateOrAddSkillFormParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.read(params.formKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          AddSkillNameFieldConsumer(
            skillNameProvider: params.skillNameProvider,
          ),
          AddSkillPercentSliderConsumer(
            skillPercentProvider: params.skillPercentProvider,
            initialValue: params.skill?.percent,
          ),
        ],
      ),
    );
  }
}

class AddSkillNameFieldConsumer extends ConsumerWidget {
  const AddSkillNameFieldConsumer({super.key, required this.skillNameProvider});

  final AutoDisposeStateProvider<String> skillNameProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final skillName = ref.watch(skillNameProvider);
    return CustomDataInput(
      initialValue: skillName,
      autofocus: true,
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.name,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        if (value != skillName) {
          ref.read(skillNameProvider.notifier).state = value;
        }
      },
    );
  }
}

class AddSkillPercentSliderConsumer extends ConsumerWidget {
  const AddSkillPercentSliderConsumer({
    super.key,
    required this.skillPercentProvider,
    this.initialValue,
  });

  final AutoDisposeStateProvider<double> skillPercentProvider;
  final double? initialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillPercent = ref.watch(skillPercentProvider);
    return Row(
      spacing: 16.w,
      children: [
        Expanded(
          child: Material(
            child: ShadSlider(
              initialValue: skillPercent,
              max: 1.0,
              divisions: 10,
              onChanged: (newValue) {
                if (newValue != ref.read(skillPercentProvider)) {
                  ref.read(skillPercentProvider.notifier).state = newValue;
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
