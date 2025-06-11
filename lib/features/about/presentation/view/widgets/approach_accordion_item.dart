import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/about.dart' show ApproachModel;
import 'confirm_delete_approach_consumer_button.dart';
import 'edit_approach_consumer_button.dart';
import 'edit_approach_form_consumer.dart';

class ApproachAccordionItem extends StatelessWidget {
  const ApproachAccordionItem({super.key, required this.approach});

  final ApproachModel approach;

  @override
  Widget build(BuildContext context) {
    return ShadAccordionItem(
      value: approach,
      title: Text(approach.title, maxLines: 1),
      titleStyle: context.shadTextTheme.p.copyWith(
        fontSize: 12.sp,
        overflow: TextOverflow.ellipsis,
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            approach.description
                .split('.')
                .map((e) => e.trim())
                .where((e) => e.isNotEmpty)
                .map((e) => '• $e.')
                .join('\n\n'),
            style: context.shadTextTheme.muted.copyWith(fontSize: 12.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed:
                    () => context.showAlertDialog(
                      titleText: AppStrings.deleteApproach,
                      descriptionText: AppStrings.sureToDeleteApproach,
                      actions: [
                        ShadButton.outline(
                          child: const Text(AppStrings.cancel),
                          onPressed: () => context.pop(),
                        ),
                        ConfirmDeleteApproachConsumerButton(
                          approachId: approach.id,
                        ),
                      ],
                    ),
                icon: const Icon(LucideIcons.trash400),
              ),
              IconButton(
                onPressed:
                    () => context.showDialog(
                      titleText: AppStrings.editApproach,
                      child: EditApproachFormConsumer(approach: approach),
                      actions: [EditApproachConsumerButton(approach: approach)],
                    ),
                icon: const Icon(LucideIcons.pen400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
