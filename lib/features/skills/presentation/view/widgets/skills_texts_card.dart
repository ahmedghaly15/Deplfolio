import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../../data/models/skills_texts.dart';

class SkillsTextsCard extends StatelessWidget {
  const SkillsTextsCard({super.key, required this.skillsText});

  final SkillsTexts skillsText;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: AppUtils.cardRadius,
      columnMainAxisSize: MainAxisSize.min,
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomDataInput(
            initialValue: skillsText.headerSmallText,
            labelText: AppStrings.headerSmallText,
          ),
          Text(
            AppStrings.headerBigText,
            style: context.shadTextTheme.p.copyWith(
              color: ColorManager.primaryColor,
            ),
          ),
          CustomDataInput(
            initialValue: skillsText.headerBigText.text1,
            labelText: AppStrings.headerBigText1,
          ),
          CustomDataInput(
            initialValue: skillsText.headerBigText.colorfulString,
            labelText: AppStrings.headerBigTextColoredString,
          ),
          CustomDataInput(
            initialValue: skillsText.headerBigText.text3,
            labelText: AppStrings.headerBigText3,
          ),
        ],
      ),
    );
  }
}
