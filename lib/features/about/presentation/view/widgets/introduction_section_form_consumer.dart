import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/introduction_section.dart';
import '../../providers/introduction_section_form_providers.dart';
import 'introduction_big_text_1_field_consumer.dart';
import 'introduction_big_text_2_field_consumer.dart';
import 'introduction_colorful_big_text_field_consumer.dart';
import 'introduction_description_field_consumer.dart';
import 'introduction_header_small_text_field_consumer.dart';
import 'introduction_see_my_work_field_consumer.dart';

class IntroductionSectionFormConsumer extends ConsumerWidget {
  const IntroductionSectionFormConsumer({
    super.key,
    required this.introductionSection,
  });

  final IntroductionSection introductionSection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(introductionSectionFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: IntroductionHeaderSmallTextFieldConsumer(
              headerSmallText: introductionSection.headerSmallText,
            ),
          ),
          IntroductionDescriptionFieldConsumer(
            description: introductionSection.description,
          ),
          IntroductionSeeMyWorkFieldConsumer(
            seeMyWorkLink: introductionSection.seeMyWorkLink,
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            child: Text(
              AppStrings.headerBigText,
              style: context.shadTextTheme.p.copyWith(
                color: ColorManager.primaryColor,
              ),
            ),
          ),
          IntroductionBigText1FieldConsumer(
            headerBigText1: introductionSection.headerBigText.text1,
          ),
          IntroductionBigText2FieldConsumer(
            headerBigText2: introductionSection.headerBigText.text2,
          ),
          IntroductionColorfulBigTextFieldConsumer(
            colorfulString: introductionSection.headerBigText.coloredString,
          ),
        ],
      ),
    );
  }
}
