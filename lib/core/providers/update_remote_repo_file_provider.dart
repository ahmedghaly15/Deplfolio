// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/api_request_result.dart';
import '../models/update_remote_repo_file_params.dart';
import '../repositories/github_repo.dart';
import 'pick_file_provider.dart';

part 'update_remote_repo_file_provider.g.dart';

@riverpod
class UpdateRemoteRepoFile extends _$UpdateRemoteRepoFile {
  @override
  AsyncValue<void>? build() => null;

  Future<void> updateRemoteRepoFile(UpdateRemoteRepoFileParams params) async {
    final pickedFile = await ref
        .read(pickFileProvider.notifier)
        .pickFile(params.pickedFileAllowedExtensions);
    if (pickedFile == null) return;
    state = const AsyncLoading();
    final result = await ref
        .read(githubRepoProvider)
        .updateRemoteRepoFile(params.copyWith(pickedFile: pickedFile));
    switch (result) {
      case ApiRequestSuccess():
        state = const AsyncData(null);
      case ApiRequestFailure(:final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }
}
