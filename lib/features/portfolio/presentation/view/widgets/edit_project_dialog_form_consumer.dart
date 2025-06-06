import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadForm;

import '../../../../../core/helpers/input_validator.dart';
import '../../../../../core/models/project.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_project_provider.dart';
import 'project_description_field_consumer.dart';
import 'project_download_url_field_consumer.dart';
import 'project_github_url_field_consumer.dart';
import 'project_promo_url_field_consumer.dart';
import 'project_title_field_consumer.dart';

class EditProjectDialogFormConsumer extends ConsumerWidget {
  const EditProjectDialogFormConsumer({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(updateProjectFormKeyProvider);
    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDataInput(
            initialValue: project.imgPath,
            labelText: AppStrings.imageUrl,
            validator: (value) => InputValidator.validatingEmptyField(value),
          ),
          ProjectTitleFieldConsumer(projectTitle: project.title),
          ProjectDescriptionFieldConsumer(description: project.description),
          ProjectDownloadUrlFieldConsumer(downloadUrl: project.downloadLink),
          ProjectPromoUrlFieldConsumer(promoUrl: project.promoLink),
          ProjectGitHubUrlFieldConsumer(githubUrl: project.gitHubLink),
        ],
      ),
    );
  }
}
