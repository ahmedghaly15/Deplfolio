import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../data/models/about.dart';
import 'edit_work_experience_consumer_button.dart';
import 'edit_work_experience_form_consumer.dart';

class WorkExperienceItem extends StatelessWidget {
  final WorkExperienceModel workExperience;

  const WorkExperienceItem({super.key, required this.workExperience});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: AppUtils.cardRadius,
      columnMainAxisSize: MainAxisSize.min,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      footer: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: IconButton(
          onPressed:
              () => context.showDialog(
                scrollPadding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 48.h,
                ),
                titleText: AppStrings.editWorkExperience,
                child: EditWorkExperienceFormConsumer(
                  workExperienceModel: workExperience,
                ),
                actions: [
                  EditWorkExperienceConsumerButton(
                    workExperience: workExperience,
                  ),
                ],
              ),
          icon: const Icon(LucideIcons.pen400),
        ),
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
      child: Container(
        margin: EdgeInsets.only(top: 16.h),
        child: Column(
          spacing: 16.h,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(workExperience.experienceStatus.getImgPath),
            ),
            Text(
              workExperience.description
                  .split('.')
                  .map((e) => e.trim()) // Remove leading/trailing whitespace
                  .where((e) => e.isNotEmpty) // Filter out empty strings
                  .map((e) => '• $e.')
                  .join('\n\n'),
              style: context.shadTextTheme.small.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
