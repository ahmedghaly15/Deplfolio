// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_cv_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadCvRequestBody _$UploadCvRequestBodyFromJson(Map<String, dynamic> json) =>
    UploadCvRequestBody(
      fileEncodedContent: json['fileEncodedContent'] as String,
      message:
          json['message'] as String? ?? 'Uploaded PDF via Deplfolio: Deploy 🚀',
      branchName: json['branch'] as String? ?? 'master',
    );

Map<String, dynamic> _$UploadCvRequestBodyToJson(
  UploadCvRequestBody instance,
) => <String, dynamic>{
  'message': instance.message,
  'fileEncodedContent': instance.fileEncodedContent,
  'branch': instance.branchName,
};
