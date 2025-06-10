import 'dart:convert' show base64Encode;
import 'dart:io' show File;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/api_request_result.dart';
import '../api/github_api_service.dart';
import '../models/update_remote_repo_file_params.dart';
import '../models/update_remote_repo_file_request_body.dart';
import '../utils/functions/api_execute_and_handle_errors.dart';

final githubRepoProvider = Provider.autoDispose<GitHubRepo>((ref) {
  final apiService = ref.read(githubApiServiceProvider);
  return GitHubRepo(apiService);
});

class GitHubRepo {
  final GitHubApiService _apiService;

  GitHubRepo(this._apiService);

  Future<String?> _checkForGithubFileExistence(String saferFilePathUrl) async {
    final response = await _apiService.checkForGithubFileExistence(
      saferFilePathUrl,
    );
    return response.sha;
  }

  Future<ApiRequestResult<void>> updateRemoteRepoFile(
    UpdateRemoteRepoFileParams params,
  ) {
    final saferFilePathUrl = Uri.encodeComponent(params.remoteFilePath);
    final filePath = params.pickedFile?.files.single.path!;
    final fileBytes = File(filePath!).readAsBytesSync();
    final encodedContent = base64Encode(fileBytes);
    return apiExecuteAndHandleErrors<void>(() async {
      final sha = await _checkForGithubFileExistence(saferFilePathUrl);
      await _apiService.updateRemoteFile(
        saferFilePathUrl,
        UpdateRemoteRepoFileRequestBody(
          message: params.commitMessage,
          fileEncodedContent: encodedContent,
          sha: sha,
        ),
      );
    });
  }
}
