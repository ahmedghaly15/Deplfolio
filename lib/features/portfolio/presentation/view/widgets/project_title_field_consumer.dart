import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_project_provider.dart' show projectTitleProvider;

class ProjectTitleFieldConsumer extends ConsumerWidget {
  const ProjectTitleFieldConsumer({super.key, required this.projectTitle});

  final String projectTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDataInput(
      initialValue: projectTitle,
      labelText: AppStrings.name,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        // comapring new value with old state stored in provider
        if (value != ref.read(projectTitleProvider)) {
          ref.read(projectTitleProvider.notifier).state = value;
        }
      },
    );
  }
}
