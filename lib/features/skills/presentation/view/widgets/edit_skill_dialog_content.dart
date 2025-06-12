import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../../data/models/fetch_skills.dart' show SkillModel;

class EditSkillDialogContent extends StatelessWidget {
  const EditSkillDialogContent({super.key, required this.skill});

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDataInput(
          initialValue: skill.name,
          labelText: AppStrings.name,
          textCapitalization: TextCapitalization.words,
        ),
        CustomDataInput(
          initialValue: skill.percent.toString(),
          labelText: AppStrings.percent,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
