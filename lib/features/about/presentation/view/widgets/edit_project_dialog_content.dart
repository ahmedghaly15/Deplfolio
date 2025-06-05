import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/project.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';

class EditProjectDialogContent extends StatelessWidget {
  const EditProjectDialogContent({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDataInput(
          initialValue: project.imgPath,
          labelText: AppStrings.imageUrl,
        ),
        CustomDataInput(
          initialValue: project.title,
          labelText: AppStrings.name,
        ),
        CustomDataInput(
          initialValue: project.description,
          labelText: AppStrings.description,
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
    );
  }
}
