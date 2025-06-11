import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_work_experience_provider.dart';

class WorkExperienceCompanyFieldConsumer extends ConsumerWidget {
  const WorkExperienceCompanyFieldConsumer({super.key, required this.company});

  final String company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final companyProviderValue = ref.watch(workExperienceCompanyProvider);
    return CustomDataInput(
      initialValue: company,
      labelText: AppStrings.company,
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comparing new value with old state stored in provider
        if (value != companyProviderValue) {
          ref.read(workExperienceCompanyProvider.notifier).state = value;
        }
      },
    );
  }
}
