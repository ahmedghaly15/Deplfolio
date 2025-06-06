import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/introduction_section_form_providers.dart'
    show aboutHeaderSmallTxtProvider;

class IntroductionHeaderSmallTextFieldConsumer extends ConsumerWidget {
  const IntroductionHeaderSmallTextFieldConsumer({
    super.key,
    required this.headerSmallText,
  });

  final String headerSmallText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      initialValue: headerSmallText,
      labelText: AppStrings.headerSmallText,
      textCapitalization: TextCapitalization.sentences,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comapring new value with old state stored in provider
        if (value != ref.read(aboutHeaderSmallTxtProvider)) {
          ref.read(aboutHeaderSmallTxtProvider.notifier).state = value;
        }
      },
    );
  }
}
