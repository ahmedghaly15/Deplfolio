import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadCard;

import '../../../../../core/utils/app_utils.dart';
import '../../../data/models/skills_texts.dart';
import 'update_skill_header_texts_form_consumer.dart';

class SkillsTextsCard extends StatelessWidget {
  const SkillsTextsCard({super.key, required this.skillsText});

  final SkillsTexts skillsText;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: AppUtils.cardRadius,
      columnMainAxisSize: MainAxisSize.min,
      child: UpdateSkillHeaderTextsFormConsumer(skillsText: skillsText),
    );
  }
}
