import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../provider/update_skill_header_provider.dart';

class SkillHeaderColorfulTextFieldConsumer extends ConsumerWidget {
  const SkillHeaderColorfulTextFieldConsumer({
    super.key,
    required this.skillHeaderColorfulText,
  });

  final String skillHeaderColorfulText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final colorfulText = ref.watch(skillHeaderColorfulTextProvider);
    return CustomDataInput(
      initialValue: skillHeaderColorfulText,
      labelText: AppStrings.headerBigTextColoredString,
      onChanged: (value) {
        if (value != colorfulText) {
          ref.read(skillHeaderColorfulTextProvider.notifier).state = value;
        }
      },
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}
