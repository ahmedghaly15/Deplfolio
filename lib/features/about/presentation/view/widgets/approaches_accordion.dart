import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadAccordion;

import '../../../data/models/about.dart' show ApproachModel;
import 'approach_accordion_item.dart';

class ApproachesAccordion extends StatelessWidget {
  const ApproachesAccordion({super.key, required this.approaches});

  final List<ApproachModel> approaches;

  @override
  Widget build(BuildContext context) {
    return ShadAccordion<ApproachModel>(
      maintainState: true,
      children:
          approaches
              .map((approach) => ApproachAccordionItem(approach: approach))
              .toList(),
    );
  }
}
