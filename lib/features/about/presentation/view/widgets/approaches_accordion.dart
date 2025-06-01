import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../data/models/about.dart' show ApproachModel;

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
                  child: Text(
                    approach.description,
                    style: context.shadTextTheme.muted.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
