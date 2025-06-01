import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/about.dart';
import '../../../data/models/introduction_section.dart';
import 'introduction_section_card.dart';
import 'projects_section_card.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key, required this.about});

  final About about;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
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
        ],
      ),
    );
  }
}
