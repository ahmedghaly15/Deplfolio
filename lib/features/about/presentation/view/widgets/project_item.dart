import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_cached_network_img.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/about.dart';
import 'edit_project_dialog_content.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:
          () => context.showDialog(
            scrollPadding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 56.h,
              bottom: 24.h,
            ),
            titleText: AppStrings.editProject,
            actions: [
              PrimaryButton(onPressed: () {}, text: AppStrings.saveChanges),
            ],
            child: EditProjectDialogContent(project: project),
          ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 3,
            child: CustomCachedNetworkImg(imageUrl: project.imgPath),
          ),
          Text(project.title, style: context.shadTextTheme.small),
        ],
      ),
    );
  }
}
