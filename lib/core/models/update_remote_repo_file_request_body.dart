import 'package:json_annotation/json_annotation.dart';

part 'update_remote_repo_file_request_body.g.dart';

@JsonSerializable()
class UpdateRemoteRepoFileRequestBody {
  final String? message;
  @JsonKey(name: 'content')
  final String fileEncodedContent;
  @JsonKey(name: 'branch')
  final String branchName;
  final String? sha;

  UpdateRemoteRepoFileRequestBody({
    required this.fileEncodedContent,
    this.message = 'Updated CV via Deplfolio Mobile App: Deploy 🚀',
    this.branchName = 'master',
    this.sha,
  });

  factory UpdateRemoteRepoFileRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateRemoteRepoFileRequestBodyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateRemoteRepoFileRequestBodyToJson(this);
}
