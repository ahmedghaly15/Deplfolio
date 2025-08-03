import 'dart:convert' show base64Encode;
import 'dart:io' show File;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/api_request_result.dart';
import '../api/github_api_service.dart';
import '../models/check_for_github_file_existence_response.dart';
import '../models/update_remote_repo_file_params.dart';
import '../models/update_remote_repo_file_request_body.dart';
import '../models/update_remote_repo_img_params.dart';
import '../utils/const_strings.dart';
import '../utils/functions/api_execute_and_handle_errors.dart';

final githubRepoProvider = Provider.autoDispose<GitHubRepo>((ref) {
  final apiService = ref.read(githubApiServiceProvider);
  return GitHubRepoImpl(apiService);
});

abstract class GitHubRepo {
  Future<ApiRequestResult<CheckForGithubFileExistenceResponse>>
  checkForGithubFileExistence(String saferFilePathUrl);

  Future<ApiRequestResult<void>> updateRemoteRepoFile(
    UpdateRemoteRepoFileParams params,
  );

  Future<ApiRequestResult<void>> updateRemoteRepoImg(
    UpdateRemoteRepoImgParams params,
  );
}

class GitHubRepoImpl implements GitHubRepo {
  final GitHubApiService _apiService;

  GitHubRepoImpl(this._apiService);

  @override
  Future<ApiRequestResult<CheckForGithubFileExistenceResponse>>
  checkForGithubFileExistence(String saferFilePathUrl) {
    return apiExecuteAndHandleErrors<CheckForGithubFileExistenceResponse>(
      () async =>
          await _apiService.checkForGithubFileExistence(saferFilePathUrl),
    );
  }

  @override
  Future<ApiRequestResult<void>> updateRemoteRepoFile(
    UpdateRemoteRepoFileParams params,
  ) async {
    // Used Uri.encodeFull to encode only spaces or special characters
    final saferFilePathUrl = Uri.encodeFull(params.remoteFilePath);
    final filePath = params.pickedFile?.files.single.path!;
    final fileBytes = File(filePath!).readAsBytesSync();
    final encodedContent = base64Encode(fileBytes);
    return apiExecuteAndHandleErrors<void>(
      () async => await _apiService.updateRemoteFile(
        saferFilePathUrl,
        UpdateRemoteRepoFileRequestBody(
          message: params.commitMessage,
          fileEncodedContent: encodedContent,
          sha: params.sha,
        ),
      ),
    );
  }

  @override
  Future<ApiRequestResult<void>> updateRemoteRepoImg(
    UpdateRemoteRepoImgParams params,
  ) async {
    final saferUrl = Uri.encodeFull(
      '${ConstStrings.assetsRemoteRepoPath}images/${params.projectTitle.toLowerCase()}_icon.png',
    );
    final fileBytes = await params.pickedFile?.readAsBytes();
    final encodedContent = base64Encode(fileBytes!.toList());
    return apiExecuteAndHandleErrors<void>(
      () async => await _apiService.updateRemoteFile(
        saferUrl,
        UpdateRemoteRepoFileRequestBody(
          message:
              'Updated ${params.projectTitle} icon via Deplfolio Mobile App: Deploy 🚀',
          fileEncodedContent: encodedContent,
          sha: params.sha,
        ),
      ),
    );
  }
}
