import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/about.dart' show ApproachModel;
import 'edit_approach_consumer_button.dart';
import 'edit_approach_form_consumer.dart';

class ApproachesAccordion extends StatelessWidget {
  const ApproachesAccordion({super.key, required this.approaches});

  final List<ApproachModel> approaches;

  @override
  Widget build(BuildContext context) {
    return ShadAccordion<ApproachModel>(
      maintainState: true,
      children:
          approaches
              .map(
                (approach) => ShadAccordionItem(
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
                        approach.description,
                        style: context.shadTextTheme.muted.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(LucideIcons.trash400),
                          ),
                          IconButton(
                            onPressed:
                                () => context.showDialog(
                                  titleText: AppStrings.editApproach,
                                  child: EditApproachFormConsumer(
                                    approach: approach,
                                  ),
                                  actions: [
                                    EditApproachConsumerButton(
                                      approach: approach,
                                    ),
                                  ],
                                ),
                            icon: const Icon(LucideIcons.pen400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}
