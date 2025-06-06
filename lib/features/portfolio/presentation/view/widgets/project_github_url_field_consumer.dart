import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_data_input.dart';
import '../../providers/update_project_provider.dart'
    show projectGitHubUrlProvider;

class ProjectGitHubUrlFieldConsumer extends ConsumerWidget {
  const ProjectGitHubUrlFieldConsumer({super.key, required this.githubUrl});

  final String? githubUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDataInput(
      initialValue: githubUrl ?? '',
      labelText: AppStrings.githubUrl,
      onChanged: (value) {
        // comapring new value with old state stored in provider
        if (value != ref.read(projectGitHubUrlProvider)) {
          ref.read(projectGitHubUrlProvider.notifier).state = value;
        }
      },
    );
  }
}
