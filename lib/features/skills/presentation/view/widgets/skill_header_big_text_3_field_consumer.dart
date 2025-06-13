import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../provider/update_skill_header_provider.dart';

class SkillHeaderBigText3FieldConsumer extends ConsumerWidget {
  const SkillHeaderBigText3FieldConsumer({
    super.key,
    required this.skillHeaderBigText3,
  });

  final String skillHeaderBigText3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final text3 = ref.watch(skillHeaderBigText3Provider);
    return CustomDataInput(
      initialValue: skillHeaderBigText3,
      labelText: AppStrings.headerBigText3,
      onChanged: (value) {
        if (value != text3) {
          ref.read(skillHeaderBigText3Provider.notifier).state = value;
        }
      },
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}
