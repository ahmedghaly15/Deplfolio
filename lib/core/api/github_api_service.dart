import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/check_for_github_file_existence_response.dart';
import '../models/update_remote_repo_file_request_body.dart';
import 'dio_factory.dart';
import 'end_points.dart';

part 'github_api_service.g.dart';

final githubApiServiceProvider = Provider.autoDispose<GitHubApiService>((ref) {
  final dio = ref.read(dioProvider);
  return GitHubApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class GitHubApiService {
  factory GitHubApiService(Dio dio, {String baseUrl}) = _GitHubApiService;

  @GET('${EndPoints.contents}{saferFilePathUrl}')
  Future<CheckForGithubFileExistenceResponse> checkForGithubFileExistence(
    @Path('saferFilePathUrl') String saferFilePathUrl,
  );

  @PUT('${EndPoints.contents}{saferFilePathUrl}')
  Future<void> updateRemoteFile(
    @Path('saferFilePathUrl') String saferFilePathUrl,
    @Body() UpdateRemoteRepoFileRequestBody body,
  );
}
