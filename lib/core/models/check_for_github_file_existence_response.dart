import 'package:json_annotation/json_annotation.dart';

part 'check_for_github_file_existence_response.g.dart';

@JsonSerializable()
class CheckForGithubFileExistenceResponse {
  final String? name, path, sha, url, type, content;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'git_url')
  final String? gitUrl;
  @JsonKey(name: 'download_url')
  final String? downloadUrl;

  CheckForGithubFileExistenceResponse({
    this.name,
    this.path,
    this.sha,
    this.url,
    this.type,
    this.content,
    this.htmlUrl,
    this.gitUrl,
    this.downloadUrl,
  });

  factory CheckForGithubFileExistenceResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$CheckForGithubFileExistenceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CheckForGithubFileExistenceResponseToJson(this);
}
