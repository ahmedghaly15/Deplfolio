import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../data/models/about.dart';
import '../../../data/models/introduction_section.dart';
import 'approaches_accordion.dart';
import 'introduction_section_card.dart';
import 'projects_section_card.dart';
import 'section_title.dart';
import 'work_experience_item.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key, required this.about});

  final About about;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.screenPadding,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: IntroductionSectionCard(
              introductionSection: IntroductionSection(
                headerSmallText: about.headerSmallText,
                description: about.description,
                seeMyWorkLink: about.seeMyWorkLink,
                headerBigText: about.headerBigText,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              child: ProjectsSectionCard(projects: about.projects),
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: SectionTitle(title: AppStrings.workExperience),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            sliver: SliverList.separated(
              itemCount: about.workExperience.length,
              itemBuilder:
                  (_, index) => WorkExperienceItem(
                    workExperience: about.workExperience[index],
                  ),
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(child: SectionTitle(title: AppStrings.approaches)),
          ),
          SliverToBoxAdapter(
            child: ApproachesAccordion(approaches: about.approaches),
          ),
        ],
      ),
    );
  }
}
