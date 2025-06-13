import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../provider/update_skill_header_provider.dart';

class SkillHeaderBigText1FieldConsumer extends ConsumerWidget {
  const SkillHeaderBigText1FieldConsumer({
    super.key,
    required this.headerBigText1,
  });

  final String headerBigText1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final text1 = ref.watch(skillHeaderBigText1Provider);
    return CustomDataInput(
      initialValue: headerBigText1,
      labelText: AppStrings.headerBigText1,
      onChanged: (value) {
        if (value != text1) {
          ref.read(skillHeaderBigText1Provider.notifier).state = value;
        }
      },
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}
