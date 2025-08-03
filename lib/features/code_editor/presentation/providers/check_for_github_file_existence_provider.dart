// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_request_result.dart';
import '../../domain/use_cases/check_for_github_file_existence.dart'
    show checkForGithubFileExistenceUseCaseProvider;

part 'check_for_github_file_existence_provider.g.dart';

@riverpod
class CheckForGithubFileExistence extends _$CheckForGithubFileExistence {
  @override
  AsyncValue<String?>? build() => null;

  void execute(String remoteFilePath) async {
    final saferFilePathUrl = Uri.encodeFull(remoteFilePath);
    state = const AsyncLoading();
    final result = await ref.read(checkForGithubFileExistenceUseCaseProvider)(
      saferFilePathUrl,
    );
    switch (result) {
      case ApiRequestSuccess(data: final data):
        state = AsyncData(data.sha);
      case ApiRequestFailure(errorModel: final errorModel):
        state = AsyncError(errorModel.message, StackTrace.current);
    }
  }
}
