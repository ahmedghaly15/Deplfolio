import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_input_form_field.dart';

class IntroductionSectionCard extends StatelessWidget {
  const IntroductionSectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: BorderRadius.circular(16.r),
      columnMainAxisSize: MainAxisSize.min,
      title: Text(AppStrings.introduction, style: context.shadTextTheme.h4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16.h,
        children: const [
          CustomInputFormField(label: Text(AppStrings.headerSmallText)),
          CustomInputFormField(label: Text(AppStrings.myDescription)),
          CustomInputFormField(label: Text(AppStrings.seeMyWorkUrl)),
        ],
      ),
    );
  }
}
