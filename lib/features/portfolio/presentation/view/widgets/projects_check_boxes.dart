import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/project.dart';
import 'show_project_in_about_check_box_consumer.dart';

class ProjectsCheckboxes extends StatelessWidget {
  const ProjectsCheckboxes({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          projects
              .map((p) => ShowProjectInAboutCheckboxConsumer(project: p))
              .toList(),
    );
  }
}
