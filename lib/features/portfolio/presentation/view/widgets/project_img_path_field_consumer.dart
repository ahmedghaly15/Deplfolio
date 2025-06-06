import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_project_provider.dart';

class ProjectImgPathFieldConsumer extends ConsumerWidget {
  const ProjectImgPathFieldConsumer({super.key, required this.projectImgPath});

  final String projectImgPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgPath = ref.watch(projectImgPathProvider(projectImgPath));
    return CustomDataInput(
      initialValue: imgPath,
      labelText: AppStrings.imageUrl,
      validator: (value) => InputValidator.validatingEmptyField(value),
    );
  }
}
