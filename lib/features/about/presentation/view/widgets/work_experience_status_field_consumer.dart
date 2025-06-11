import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/enums/experience_status.dart' show ExperienceStatus;
import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/providers/autovalidate_mode_notifier.dart'
    show autovalidateModeProvider;
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_work_experience_provider.dart';

class WorkExperienceStatusFieldConsumer extends ConsumerWidget {
  const WorkExperienceStatusFieldConsumer({
    super.key,
    required this.experienceStatus,
  });

  final ExperienceStatus experienceStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final statusProviderValue =
        ref.watch(workExperienceStatusProvider(experienceStatus)).getName;
    return CustomDataInput(
      initialValue: experienceStatus.getName,
      labelText: AppStrings.status,
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comparing new value with old state stored in provider
        if (value != statusProviderValue) {
          ref.read(workExperienceTitleProvider.notifier).state = value;
        }
      },
    );
  }
}
