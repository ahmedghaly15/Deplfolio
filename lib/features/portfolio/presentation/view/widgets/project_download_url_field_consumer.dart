import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_project_provider.dart'
    show projectDownloadUrlProvider;

class ProjectDownloadUrlFieldConsumer extends ConsumerWidget {
  const ProjectDownloadUrlFieldConsumer({super.key, required this.downloadUrl});

  final String? downloadUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDataInput(
      initialValue: downloadUrl ?? '',
      labelText: AppStrings.downloadUrl,
      onChanged: (value) {
        ref.read(projectDownloadUrlProvider.notifier).state = value;
      },
    );
  }
}
