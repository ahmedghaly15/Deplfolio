import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/introduction_section.dart';

class IntroductionSectionCard extends StatelessWidget {
  const IntroductionSectionCard({super.key, required this.introductionSection});

  final IntroductionSection introductionSection;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: AppUtils.cardRadius,
      columnMainAxisSize: MainAxisSize.min,
      title: Text(AppStrings.introduction, style: context.shadTextTheme.h4),
      child: Column(
        spacing: 16.h,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: CustomDataInput(
              initialValue: introductionSection.headerSmallText,
              labelText: AppStrings.headerSmallText,
            ),
          ),
          CustomDataInput(
            initialValue: introductionSection.description,
            labelText: AppStrings.myDescription,
          ),
          CustomDataInput(
            initialValue: introductionSection.seeMyWorkLink,
            labelText: AppStrings.seeMyWorkUrl,
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            child: const Text(AppStrings.headerBigText),
          ),
          CustomDataInput(
            labelText: AppStrings.headerBigText1,
            initialValue: introductionSection.headerBigText.text1,
          ),
          CustomDataInput(
            labelText: AppStrings.headerBigText2,
            initialValue: introductionSection.headerBigText.text2,
          ),
          CustomDataInput(
            labelText: AppStrings.headerBigTextColoredString,
            initialValue: introductionSection.headerBigText.coloredString,
          ),
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: PrimaryButton(
              expands: true,
              text: AppStrings.saveChanges,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
