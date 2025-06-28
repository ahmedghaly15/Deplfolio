// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_for_github_file_existence_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckForGithubFileExistenceResponse
    _$CheckForGithubFileExistenceResponseFromJson(Map<String, dynamic> json) =>
        CheckForGithubFileExistenceResponse(
          name: json['name'] as String?,
          path: json['path'] as String?,
          sha: json['sha'] as String?,
          url: json['url'] as String?,
          type: json['type'] as String?,
          content: json['content'] as String?,
          htmlUrl: json['html_url'] as String?,
          gitUrl: json['git_url'] as String?,
          downloadUrl: json['download_url'] as String?,
        );

Map<String, dynamic> _$CheckForGithubFileExistenceResponseToJson(
        CheckForGithubFileExistenceResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'sha': instance.sha,
      'url': instance.url,
      'type': instance.type,
      'content': instance.content,
      'html_url': instance.htmlUrl,
      'git_url': instance.gitUrl,
      'download_url': instance.downloadUrl,
    };
