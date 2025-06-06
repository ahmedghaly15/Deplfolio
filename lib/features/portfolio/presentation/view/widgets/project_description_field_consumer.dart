import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_project_provider.dart'
    show projectDescriptionProvider;

class ProjectDescriptionFieldConsumer extends ConsumerWidget {
  const ProjectDescriptionFieldConsumer({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDataInput(
      initialValue: description,
      labelText: AppStrings.description,
      validator: (value) => InputValidator.validatingEmptyField(value),
      onChanged: (value) {
        ref.read(projectDescriptionProvider.notifier).state = value;
      },
    );
  }
}
