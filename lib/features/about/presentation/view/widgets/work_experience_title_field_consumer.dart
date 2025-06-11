import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_work_experience_provider.dart';

class WorkExperienceTitleFieldConsumer extends ConsumerWidget {
  const WorkExperienceTitleFieldConsumer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final titleProviderValue = ref.watch(workExperienceTitleProvider);
    return CustomDataInput(
      initialValue: title,
      labelText: AppStrings.title,
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comparing new value with old state stored in provider
        if (value != titleProviderValue) {
          ref.read(workExperienceTitleProvider.notifier).state = value;
        }
      },
    );
  }
}
