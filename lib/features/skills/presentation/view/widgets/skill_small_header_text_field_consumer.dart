import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../provider/update_skill_header_provider.dart'
    show skillHeaderSmallTextProvider;

class SkillSmallHeaderTextFieldConsumer extends ConsumerWidget {
  const SkillSmallHeaderTextFieldConsumer({
    super.key,
    required this.headerSmallText,
  });

  final String headerSmallText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      initialValue: headerSmallText,
      labelText: AppStrings.headerSmallText,
      onChanged: (value) {
        ref.read(skillHeaderSmallTextProvider.notifier).state = value;
      },
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}
