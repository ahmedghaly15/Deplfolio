import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/project.dart';

import '../../../../../core/utils/app_strings.dart';
import 'edit_project_dialog_form_consumer.dart';
import 'project_img_picker_consumer.dart';

class EditProjectDialogContent extends StatelessWidget {
  const EditProjectDialogContent({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16.h,
      children: [
        Text(AppStrings.editProject, style: context.shadTextTheme.large),
        ProjectImgPickerConsumer(projectImgPath: project.imgPath),
        EditProjectDialogFormConsumer(project: project),
      ],
    );
  }
}
