import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;

import '../../../../core/api/api_request_result.dart';
import '../../../../core/models/check_for_github_file_existence_response.dart';
import '../../../../core/repositories/github_repo.dart';
import '../../../../core/use_cases/api_use_case.dart';

final checkForGithubFileExistenceUseCaseProvider =
    Provider.autoDispose<CheckForGithubFileExistenceUseCase>((ref) {
      final repo = ref.read(githubRepoProvider);
      return CheckForGithubFileExistenceUseCase(repo);
    });

class CheckForGithubFileExistenceUseCase
    implements ApiUseCase<CheckForGithubFileExistenceResponse, String> {
  final GitHubRepo _repo;

  CheckForGithubFileExistenceUseCase(this._repo);

  @override
  Future<ApiRequestResult<CheckForGithubFileExistenceResponse>> call(
    String remoteFilePath,
  ) => _repo.checkForGithubFileExistence(remoteFilePath);
}
