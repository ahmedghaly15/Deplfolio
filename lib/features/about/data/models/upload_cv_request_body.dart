import 'package:json_annotation/json_annotation.dart';

part 'upload_cv_request_body.g.dart';

@JsonSerializable()
class UploadCvRequestBody {
  final String message, fileEncodedContent;
  @JsonKey(name: 'branch')
  final String branchName;

  UploadCvRequestBody({
    required this.fileEncodedContent,
    this.message = 'Uploaded PDF via Deplfolio: Deploy 🚀',
    this.branchName = 'master',
  });

  factory UploadCvRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UploadCvRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UploadCvRequestBodyToJson(this);
}
