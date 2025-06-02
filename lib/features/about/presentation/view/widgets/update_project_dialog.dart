import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/about.dart';

class UpdateProjectDialog extends StatelessWidget {
  const UpdateProjectDialog({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 56.h, bottom: 24.h),
      child: ShadDialog(
        title: Text(project.title),
        actions: [
          PrimaryButton(onPressed: () {}, text: AppStrings.saveChanges),
        ],
        child: Column(
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
            if (project.downloadLink != null)
              CustomDataInput(
                initialValue: project.downloadLink!,
                labelText: AppStrings.downloadUrl,
              ),
            if (project.promoLink != null)
              CustomDataInput(
                initialValue: project.promoLink!,
                labelText: AppStrings.promoUrl,
              ),
            if (project.gitHubLink != null)
              CustomDataInput(
                initialValue: project.gitHubLink!,
                labelText: AppStrings.githubUrl,
              ),
          ],
        ),
      ),
    );
  }
}
