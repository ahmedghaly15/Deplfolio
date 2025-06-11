import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_work_experience_provider.dart';

class WorkExperienceEndDateFieldConsumer extends ConsumerWidget {
  const WorkExperienceEndDateFieldConsumer({super.key, required this.endDate});

  final String endDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final endDateProviderValue = ref.watch(workExperienceEndDateProvider);
    return CustomDataInput(
      initialValue: endDate,
      labelText: AppStrings.endDate,
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comparing new value with old state stored in provider
        if (value != endDateProviderValue) {
          ref.read(workExperienceEndDateProvider.notifier).state = value;
        }
      },
    );
  }
}
