import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/models/update_remote_repo_file_params.dart';
import '../../../../../core/providers/update_remote_repo_file_provider.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/const_strings.dart';

class UploadCodeFileToGitHubButtonConsumer extends ConsumerWidget {
  const UploadCodeFileToGitHubButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listener(ref, context);
    return IconButton(
      onPressed: () => _updateCodeFile(ref),
      icon: const Icon(LucideIcons.github300),
    );
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(updateRemoteRepoFileProvider, (_, current) {
      current?.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (_) => context.showToast(AppStrings.codeUpdatedSuccessfully),
      );
    });
  }

  void _updateCodeFile(WidgetRef ref) {
    ref
        .read(updateRemoteRepoFileProvider.notifier)
        .updateRemoteRepoFile(
          const UpdateRemoteRepoFileParams(
            pickedFileAllowedExtensions: ['dart'],
            remoteFilePath: ConstStrings.assetsRemoteRepoFilePath,
            commitMessage: 'Updated AppAssets via Deplfolio: Deploy 🚀',
          ),
        );
  }
}
