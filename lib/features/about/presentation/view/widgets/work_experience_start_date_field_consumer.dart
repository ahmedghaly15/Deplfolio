import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_work_experience_provider.dart';

class WorkExperienceStartDateFieldConsumer extends ConsumerWidget {
  const WorkExperienceStartDateFieldConsumer({
    super.key,
    required this.startDate,
  });

  final String startDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final startDateProviderValue = ref.watch(workExperienceStartDateProvider);
    return CustomDataInput(
      initialValue: startDate,
      labelText: AppStrings.startDate,
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comparing new value with old state stored in provider
        if (value != startDateProviderValue) {
          ref.read(workExperienceStartDateProvider.notifier).state = value;
        }
      },
    );
  }
}
