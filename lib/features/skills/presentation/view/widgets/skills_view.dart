import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../data/models/fetch_skills.dart';
import '../../../data/models/skills_texts.dart';
import 'skills_progress_sliver_list.dart';
import 'skills_texts_card.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key, required this.skills});

  final FetchSkills skills;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.screenPadding,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SkillsTextsCard(
              skillsText: SkillsTexts(
                headerSmallText: skills.headerSmallText,
                headerBigText: skills.headerBigText,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppStrings.skills,
                style: context.shadTextTheme.h3.copyWith(
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          ),
          SkillsProgressSliverList(skills: skills.skills),
        ],
      ),
    );
  }
}
