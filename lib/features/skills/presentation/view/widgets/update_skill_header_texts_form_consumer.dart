import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadForm;

import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/skills_texts.dart';
import '../../provider/update_skill_header_provider.dart';
import 'skill_header_big_text1_field_consumer.dart';
import 'skill_header_big_text_3_field_consumer.dart';
import 'skill_header_colorful_text_field_consumer.dart';
import 'skill_small_header_text_field_consumer.dart';

class UpdateSkillHeaderTextsFormConsumer extends ConsumerWidget {
  const UpdateSkillHeaderTextsFormConsumer({
    super.key,
    required this.skillsText,
  });

  final SkillsTexts skillsText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(updateSkillHeaderFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SkillSmallHeaderTextFieldConsumer(
            headerSmallText: skillsText.headerSmallText,
          ),
          Text(
            AppStrings.headerBigText,
            style: context.shadTextTheme.p.copyWith(
              color: ColorManager.primaryColor,
            ),
          ),
          SkillHeaderBigText1FieldConsumer(
            headerBigText1: skillsText.headerBigText.text1,
          ),
          SkillHeaderColorfulTextFieldConsumer(
            skillHeaderColorfulText: skillsText.headerBigText.colorfulString,
          ),
          SkillHeaderBigText3FieldConsumer(
            skillHeaderBigText3: skillsText.headerBigText.text3,
          ),
        ],
      ),
    );
  }
}
