import 'package:animate_do/animate_do.dart' show ElasticIn;
import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../../../../core/models/project.dart';
import '../../../../../core/utils/app_strings.dart';
import 'project_item.dart';
import 'projects_check_boxes.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
              onPressed:
                  () => context.showDialog(
                    titleText: AppStrings.aboutProjects,
                    child: ProjectsCheckboxes(projects: projects),
                  ),
              icon: const Icon(LucideIcons.badgeInfo400),
            ),
          ],
        ),
        SliverList.separated(
          itemBuilder:
              (_, index) =>
                  ElasticIn(child: ProjectItem(project: projects[index])),
          separatorBuilder: (_, __) => SizedBox(height: 24.h),
          itemCount: projects.length,
        ),
      ],
    );
  }
}
