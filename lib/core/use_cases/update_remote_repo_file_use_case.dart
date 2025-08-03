import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;

import '../api/api_request_result.dart';
import '../models/update_remote_repo_file_params.dart';
import '../repositories/github_repo.dart';
import 'api_use_case.dart';

final updateRemoteRepoFileUseCaseProvider =
    Provider.autoDispose<UpdateRemoteRepoFileUseCase>((ref) {
      final repo = ref.read(githubRepoProvider);
      return UpdateRemoteRepoFileUseCase(repo);
    });

class UpdateRemoteRepoFileUseCase
    implements ApiUseCase<void, UpdateRemoteRepoFileParams> {
  final GitHubRepo _repo;

  UpdateRemoteRepoFileUseCase(this._repo);

  @override
  Future<ApiRequestResult<void>> call(UpdateRemoteRepoFileParams params) =>
      _repo.updateRemoteRepoFile(params);
}
