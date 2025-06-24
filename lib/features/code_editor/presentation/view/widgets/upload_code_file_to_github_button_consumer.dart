import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/models/update_remote_repo_file_params.dart';
import '../../providers/check_for_github_file_existence_provider.dart';
import '../../providers/update_remote_repo_file_provider.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/const_strings.dart';

class UploadCodeFileToGitHubButtonConsumer extends ConsumerWidget {
  const UploadCodeFileToGitHubButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _updateRemoteRepoFileProviderListener(ref, context);
    _checkForGithubFileExistenceProviderListener(ref, context);
    return IconButton(
      onPressed:
          () => ref
              .read(checkForGithubFileExistenceProvider.notifier)
              .execute(ConstStrings.appAssetsRemoteRepoFilePath),
      icon: const Icon(LucideIcons.github300),
    );
  }

  void _checkForGithubFileExistenceProviderListener(
    WidgetRef ref,
    BuildContext context,
  ) {
    ref.listen(checkForGithubFileExistenceProvider, (_, current) {
      current?.whenOrNull(
        loading: () => context.showAlertDialog(isLoading: true),
        data: (sha) {
          context.pop;
          _updateCodeFile(ref, sha);
        },
        error: (error, _) {
          context.pop;
          context.showToast(error.toString());
        },
      );
    });
  }

  void _updateRemoteRepoFileProviderListener(
    WidgetRef ref,
    BuildContext context,
  ) {
    ref.listen(updateRemoteRepoFileProvider, (_, current) {
      current?.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (_) => context.showToast(AppStrings.codeUpdatedSuccessfully),
      );
    });
  }

  void _updateCodeFile(WidgetRef ref, String? sha) {
    ref
        .read(updateRemoteRepoFileProvider.notifier)
        .updateRemoteRepoFile(
          UpdateRemoteRepoFileParams(
            pickedFileAllowedExtensions: ['dart'],
            remoteFilePath: ConstStrings.appAssetsRemoteRepoFilePath,
            commitMessage: 'Updated AppAssets via Deplfolio: Deploy 🚀',
            sha: sha,
          ),
        );
  }
}
