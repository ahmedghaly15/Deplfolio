import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/introduction_section_form_providers.dart'
    show aboutHeaderBigText1Provider;

class IntroductionBigText1FieldConsumer extends ConsumerWidget {
  const IntroductionBigText1FieldConsumer({
    super.key,
    required this.headerBigText1,
  });

  final String headerBigText1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.headerBigText1,
      initialValue: headerBigText1,
      textCapitalization: TextCapitalization.sentences,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comapring new value with old state stored in provider
        if (value != ref.read(aboutHeaderBigText1Provider)) {
          ref.read(aboutHeaderBigText1Provider.notifier).state = value;
        }
      },
    );
  }
}
