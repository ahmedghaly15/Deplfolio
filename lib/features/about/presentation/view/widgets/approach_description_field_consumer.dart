import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_approach_provider.dart'
    show approachDescriptionProvider;

class ApproachDescriptionFieldConsumer extends ConsumerWidget {
  const ApproachDescriptionFieldConsumer({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final descriptionValue = ref.watch(approachDescriptionProvider);
    return CustomDataInput(
      initialValue: description,
      labelText: AppStrings.description,
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comparing new value with old state stored in provider
        if (value != descriptionValue) {
          ref.read(approachDescriptionProvider.notifier).state = value;
        }
      },
    );
  }
}
