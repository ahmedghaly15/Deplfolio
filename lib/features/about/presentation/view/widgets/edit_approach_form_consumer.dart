import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../data/models/about.dart' show ApproachModel;
import '../../providers/update_approach_provider.dart';
import 'approach_description_field_consumer.dart';
import 'approach_title_field_consumer.dart';

class EditApproachFormConsumer extends ConsumerWidget {
  const EditApproachFormConsumer({super.key, required this.approach});

  final ApproachModel approach;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(updateApproachFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        children: [
          ApproachTitleFieldConsumer(title: approach.title),
          ApproachDescriptionFieldConsumer(description: approach.description),
        ],
      ),
    );
  }
}
