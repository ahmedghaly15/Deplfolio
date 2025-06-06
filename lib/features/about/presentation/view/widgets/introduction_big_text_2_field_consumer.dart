import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/introduction_section_form_providers.dart'
    show aboutHeaderBigText2Provider;

class IntroductionBigText2FieldConsumer extends ConsumerWidget {
  const IntroductionBigText2FieldConsumer({
    super.key,
    required this.headerBigText2,
  });

  final String headerBigText2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.headerBigText2,
      initialValue: headerBigText2,
      textCapitalization: TextCapitalization.sentences,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comapring new value with old state stored in provider
        if (value != ref.read(aboutHeaderBigText2Provider)) {
          ref.read(aboutHeaderBigText2Provider.notifier).state = value;
        }
      },
    );
  }
}
