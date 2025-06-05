import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadCheckbox;

import '../../../../../core/models/project.dart';

class ProjectsCheckboxes extends StatelessWidget {
  const ProjectsCheckboxes({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      mainAxisSize: MainAxisSize.min,
      children:
          projects
              .map(
                (p) => ShadCheckbox(
                  value: p.shownInAbout,
                  onChanged: (value) {},
                  label: Text(
                    p.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              )
              .toList(),
    );
  }
}
