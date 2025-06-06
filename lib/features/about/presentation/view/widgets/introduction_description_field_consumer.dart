import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/introduction_section_form_providers.dart'
    show aboutDescriptionProvider;

class IntroductionDescriptionFieldConsumer extends ConsumerWidget {
  const IntroductionDescriptionFieldConsumer({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    return CustomDataInput(
      initialValue: description,
      autovalidateMode: autovalidateMode,
      labelText: AppStrings.myDescription,
      textCapitalization: TextCapitalization.sentences,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        ref.read(aboutDescriptionProvider.notifier).state = value;
      },
    );
  }
}
