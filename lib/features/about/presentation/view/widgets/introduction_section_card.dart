import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../data/models/introduction_section.dart';
import 'introduction_section_form_consumer.dart';

class IntroductionSectionCard extends StatelessWidget {
  const IntroductionSectionCard({super.key, required this.introductionSection});

  final IntroductionSection introductionSection;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: AppUtils.cardRadius,
      columnMainAxisSize: MainAxisSize.min,
      title: Text(AppStrings.introduction, style: context.shadTextTheme.h4),
      child: IntroductionSectionFormConsumer(
        introductionSection: introductionSection,
      ),
    );
  }
}
