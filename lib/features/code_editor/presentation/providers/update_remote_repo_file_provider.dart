// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_request_result.dart';
import '../../../../core/enums/remote_repo_file_type.dart';
import '../../../../core/models/update_remote_repo_file_params.dart';
import '../../../../core/repositories/github_repo.dart';
import '../../../../core/providers/pick_file_provider.dart';

part 'update_remote_repo_file_provider.g.dart';

@riverpod
class UpdateRemoteRepoFile extends _$UpdateRemoteRepoFile {
  @override
  AsyncValue<void>? build(RemoteRepoFileType fileType) => null;

  Future<void> updateRemoteRepoFile(UpdateRemoteRepoFileParams params) async {
    final pickedFile = await ref.read(pickFileProvider.notifier).pickFile();
    if (pickedFile == null) return;
    state = const AsyncLoading();
    final result = await ref
        .read(githubRepoProvider)
        .updateRemoteRepoFile(
          params.copyWith(pickedFile: pickedFile, sha: params.sha),
        );
    switch (result) {
      case ApiRequestSuccess():
        state = const AsyncData(null);
      case ApiRequestFailure(:final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }
}
