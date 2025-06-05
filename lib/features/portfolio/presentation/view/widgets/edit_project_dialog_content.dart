import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/project.dart';
import 'edit_project_consumer_button.dart';
import 'edit_project_dialog_form_consumer.dart';

class EditProjectDialogContent extends StatelessWidget {
  const EditProjectDialogContent({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 24.h,
      children: [
        EditProjectDialogFormConsumer(project: project),
        EditProjectConsumerButton(project: project),
      ],
    );
  }
}
