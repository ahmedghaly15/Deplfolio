// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_request_result.dart';
import '../../domain/use_cases/check_for_github_file_existence.dart'
    show checkForGithubFileExistenceUseCaseProvider;

part 'check_for_github_file_existence_provider.g.dart';

@riverpod
class CheckForGithubFileExistence extends _$CheckForGithubFileExistence {
  @override
  AsyncValue<String?> build() => const AsyncValue.data('');

  void execute(String remoteFilePath) async {
    final saferFilePathUrl = Uri.encodeFull(remoteFilePath);
    state = const AsyncValue.loading();
    final result = await ref.read(checkForGithubFileExistenceUseCaseProvider)(
      saferFilePathUrl,
    );
    switch (result) {
      case ApiRequestSuccess(data: final data):
        state = AsyncValue.data(data.sha);
      case ApiRequestFailure(errorModel: final errorModel):
        state = AsyncValue.error(errorModel.message, StackTrace.current);
    }
  }
}
