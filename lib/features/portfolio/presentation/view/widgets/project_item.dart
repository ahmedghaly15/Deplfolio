import 'package:deplfolio/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../../../../core/models/project.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/widgets/custom_cached_network_img.dart';
import 'edit_project_consumer_button.dart';
import 'edit_project_dialog_content.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:
          () => context.showDialog(
            gap: 0,
            scrollPadding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 56.h,
              bottom: 24.h,
            ),
            title: Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: () => context.pushNamed(Routes.codeEditor),
                icon: Icon(
                  LucideIcons.code500,
                  color: ColorManager.primaryColor,
                  size: 20.h,
                ),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(top: 16.h),
                child: EditProjectConsumerButton(project: project),
              ),
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
