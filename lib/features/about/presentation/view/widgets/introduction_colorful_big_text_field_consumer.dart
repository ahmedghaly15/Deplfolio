import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/introduction_section_form_providers.dart'
    show aboutHeaderBigTextColoredStringProvider;

class IntroductionColorfulBigTextFieldConsumer extends ConsumerWidget {
  const IntroductionColorfulBigTextFieldConsumer({
    super.key,
    required this.colorfulString,
  });
  final String colorfulString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.headerBigTextColoredString,
      initialValue: colorfulString,
      textCapitalization: TextCapitalization.sentences,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        ref.read(aboutHeaderBigTextColoredStringProvider.notifier).state =
            value;
      },
    );
  }
}
