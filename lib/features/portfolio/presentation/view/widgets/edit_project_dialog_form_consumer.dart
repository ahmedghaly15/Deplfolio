import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadForm;

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/models/project.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_project_provider.dart'
    show updateProjectFormKeyProvider;

class EditProjectDialogFormConsumer extends ConsumerWidget {
  const EditProjectDialogFormConsumer({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(updateProjectFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDataInput(
            initialValue: project.imgPath,
            labelText: AppStrings.imageUrl,
            validator: (value) => InputValidator.validatingEmptyField(value),
          ),
          CustomDataInput(
            initialValue: project.title,
            labelText: AppStrings.name,
            validator: (value) => InputValidator.validatingEmptyField(value),
          ),
          CustomDataInput(
            initialValue: project.description,
            labelText: AppStrings.description,
            validator: (value) => InputValidator.validatingEmptyField(value),
          ),
          CustomDataInput(
            initialValue: project.downloadLink ?? '',
            labelText: AppStrings.downloadUrl,
          ),
          CustomDataInput(
            initialValue: project.promoLink ?? '',
            labelText: AppStrings.promoUrl,
          ),
          CustomDataInput(
            initialValue: project.gitHubLink ?? '',
            labelText: AppStrings.githubUrl,
          ),
        ],
      ),
    );
  }
}
