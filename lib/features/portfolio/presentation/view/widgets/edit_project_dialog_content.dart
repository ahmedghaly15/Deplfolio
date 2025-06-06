import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/project.dart';

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
        ProjectImgPickerConsumer(projectImgPath: project.imgPath),
        EditProjectDialogFormConsumer(project: project),
      ],
    );
  }
}
