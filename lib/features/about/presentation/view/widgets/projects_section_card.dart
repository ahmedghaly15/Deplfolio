import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/models/project.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../portfolio/presentation/view/widgets/project_item.dart';

class ProjectsSectionCard extends StatelessWidget {
  const ProjectsSectionCard({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: AppUtils.cardRadius,
      columnMainAxisSize: MainAxisSize.min,
      title: Text(AppStrings.projects, style: context.shadTextTheme.h4),
      child: Wrap(
        spacing: 16.w,
        runSpacing: 16.h,
        children:
            projects
                .where((p) => p.shownInAbout)
                .map((p) => ProjectItem(project: p))
                .toList(),
      ),
    );
  }
}
