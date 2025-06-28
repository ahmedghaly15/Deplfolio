// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_remote_repo_file_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRemoteRepoFileRequestBody _$UpdateRemoteRepoFileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateRemoteRepoFileRequestBody(
      fileEncodedContent: json['content'] as String,
      message:
          json['message'] as String? ?? 'Updated CV via Deplfolio: Deploy 🚀',
      branchName: json['branch'] as String? ?? 'master',
      sha: json['sha'] as String?,
    );

Map<String, dynamic> _$UpdateRemoteRepoFileRequestBodyToJson(
        UpdateRemoteRepoFileRequestBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'content': instance.fileEncodedContent,
      'branch': instance.branchName,
      'sha': instance.sha,
    };
