import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadForm;

import '../../../../../core/models/project.dart';
import '../../providers/update_project_provider.dart';
import 'project_description_field_consumer.dart';
import 'project_download_url_field_consumer.dart';
import 'project_github_url_field_consumer.dart';
import 'project_img_path_field_consumer.dart';
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
          ProjectImgPathFieldConsumer(projectImgPath: project.imgPath),
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
