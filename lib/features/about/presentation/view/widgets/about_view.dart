import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/about.dart' show About;
import 'introduction_section_card.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key, required this.about});

  final About about;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
      child: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [SliverToBoxAdapter(child: IntroductionSectionCard())],
      ),
    );
  }
}
