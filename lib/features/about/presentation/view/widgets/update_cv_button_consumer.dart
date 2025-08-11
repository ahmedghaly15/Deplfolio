import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deplfolio/core/helpers/extensions.dart';

import '../../../../../core/models/update_remote_repo_file_params.dart';
import '../../../../code_editor/presentation/providers/check_for_github_file_existence_provider.dart';
import '../../../../code_editor/presentation/providers/update_remote_repo_file_provider.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/const_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';

class UpdateCvButtonConsumer extends ConsumerWidget {
  const UpdateCvButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCheckForGithubFileExistence = ref.watch(
      checkForGithubFileExistenceProvider,
    );
    _updateRemoteRepoFileProviderListener(ref, context);
    _checkForGithubFileExistenceProviderListener(ref, context);
    return PrimaryButton(
      onPressed:
          () => ref
              .read(checkForGithubFileExistenceProvider.notifier)
              .execute(ConstStrings.remoteCVPath),
      child: asyncCheckForGithubFileExistence.maybeWhen(
        orElse:
            () => Text(
              AppStrings.updateCv,
              style: context.shadTextTheme.p.copyWith(color: Colors.white),
            ),
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _checkForGithubFileExistenceProviderListener(
    WidgetRef ref,
    BuildContext context,
  ) {
    ref.listen(
      checkForGithubFileExistenceProvider,
      (_, current) => current.whenOrNull(
        data: (sha) {
          if (!sha.isNullOrEmpty) {
            ref
                .read(updateRemoteRepoFileProvider.notifier)
                .updateRemoteRepoFile(
                  UpdateRemoteRepoFileParams(
                    remoteFilePath: ConstStrings.remoteCVPath,
                    commitMessage:
                        'Updated CV via Deplfolio Mobile App: Deploy 🚀',
                    sha: sha,
                  ),
                );
          }
        },
        error: (error, _) => context.showToast(error.toString()),
      ),
    );
  }

  void _updateRemoteRepoFileProviderListener(
    WidgetRef ref,
    BuildContext context,
  ) {
    ref.listen(updateRemoteRepoFileProvider, (_, current) {
      current?.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (_) => context.showToast(AppStrings.cvUpdatedSuccessfully),
      );
    });
  }
}
