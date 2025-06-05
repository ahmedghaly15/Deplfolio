// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_cv_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadCvRequestBody _$UploadCvRequestBodyFromJson(Map<String, dynamic> json) =>
    UploadCvRequestBody(
      fileEncodedContent: json['content'] as String,
      message:
          json['message'] as String? ?? 'Updated CV via Deplfolio: Deploy 🚀',
      branchName: json['branch'] as String? ?? 'master',
      sha: json['sha'] as String?,
    );

Map<String, dynamic> _$UploadCvRequestBodyToJson(
  UploadCvRequestBody instance,
) => <String, dynamic>{
  'message': instance.message,
  'content': instance.fileEncodedContent,
  'branch': instance.branchName,
  'sha': instance.sha,
};
