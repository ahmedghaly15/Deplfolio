import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart'
    show LinearPercentIndicator;
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/cancel_button.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/fetch_skills.dart';
import '../../provider/update_skill_provider.dart'
    show updateSkillPercentProvider, updateSkillNameProvider;
import 'delete_skill_confirm_consumer_button.dart';
import 'update_or_add_skill_form_consumer.dart';

class SkillsProgressSliverList extends StatelessWidget {
  const SkillsProgressSliverList({super.key, required this.skills});

  final List<SkillModel> skills;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: skills.length,
      itemBuilder: (_, index) => SkillProgressItem(skill: skills[index]),
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
    );
  }
}

class SkillProgressItem extends StatelessWidget {
  const SkillProgressItem({super.key, required this.skill});

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          children: [
            Expanded(
              child: Text(
                skill.name,
                style: context.shadTextTheme.p,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            InkWell(
              onTap:
                  () => context.showAlertDialog(
                    titleText: AppStrings.sureToDeleteSkill,
                    actions: [
                      const CancelButton(),
                      DeleteSkillConfirmConsumerButton(skillId: skill.id),
                    ],
                  ),
              child: const Icon(LucideIcons.trash400),
            ),
            InkWell(
              onTap:
                  () => context.showDialog(
                    titleText: AppStrings.editSkill,
                    actions: [
                      PrimaryButton(
                        onPressed: () {},
                        text: AppStrings.saveChanges,
                      ),
                    ],
                    child: UpdateOrAddSkillFormConsumer(
                      skill: skill,
                      skillNameProvider: updateSkillNameProvider(skill.name),
                      skillPercentProvider: updateSkillPercentProvider(
                        skill.percent,
                      ),
                    ),
                  ),
              child: const Icon(LucideIcons.pencil400),
            ),
          ],
        ),
        LinearPercentIndicator(
          animation: true,
          lineHeight: 16.h,
          animationDuration: 1500,
          percent: skill.percent,
          linearGradient: const LinearGradient(
            colors: [ColorManager.primaryColor, ColorManager.colorC65647],
            stops: [0.0, 1.0],
          ),
          backgroundColor: const Color(0xff5C1CB2).withAlpha(77),
          padding: EdgeInsets.zero,
          barRadius: Radius.circular(24.r),
        ),
      ],
    );
  }
}
