import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../data/models/about.dart';

class WorkExperienceItem extends StatelessWidget {
  final WorkExperienceModel workExperience;

  const WorkExperienceItem({super.key, required this.workExperience});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: BorderRadius.circular(16.r),
      columnMainAxisSize: MainAxisSize.min,
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(LucideIcons.pen400),
      ),
      title: Text(
        workExperience.title,
        style: context.shadTextTheme.large,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      description: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${workExperience.startDate} - ${workExperience.endDate}',
            style: context.shadTextTheme.blockquote.copyWith(fontSize: 12.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 8.w,
            children: [
              Expanded(
                child: Text(
                  workExperience.company,
                  style: context.shadTextTheme.blockquote.copyWith(
                    fontSize: 12.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(
                workExperience.experienceStatus.getName,
                style: context.shadTextTheme.blockquote.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(workExperience.experienceStatus.getImgPath),
          ),
          Text(
            workExperience.description.map((e) => '• $e').join('\n\n'),
            style: context.shadTextTheme.small,
          ),
        ],
      ),
    );
  }
}
