import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadForm;

import '../../../data/models/about.dart' show WorkExperienceModel;
import '../../providers/update_work_experience_provider.dart';
import 'work_experience_company_field_consumer.dart';
import 'work_experience_description_field_consumer.dart';
import 'work_experience_end_date_field_consumer.dart';
import 'work_experience_start_date_field_consumer.dart';
import 'work_experience_status_shad_select_consumer.dart';
import 'work_experience_title_field_consumer.dart';

class EditWorkExperienceFormConsumer extends ConsumerWidget {
  const EditWorkExperienceFormConsumer({
    super.key,
    required this.workExperienceModel,
  });

  final WorkExperienceModel workExperienceModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(editWorkExperienceFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          WorkExperienceTitleFieldConsumer(title: workExperienceModel.title),
          WorkExperienceStartDateFieldConsumer(
            startDate: workExperienceModel.startDate,
          ),
          WorkExperienceEndDateFieldConsumer(
            endDate: workExperienceModel.endDate,
          ),
          WorkExperienceCompanyFieldConsumer(
            company: workExperienceModel.company,
          ),
          SizedBox(
            width: double.infinity,
            child: WorkExperienceStatusShadSelectConsumer(
              experienceStatus: workExperienceModel.experienceStatus,
            ),
          ),
          WorkExperienceDescriptionFieldConsumer(
            description: workExperienceModel.description,
          ),
        ],
      ),
    );
  }
}
