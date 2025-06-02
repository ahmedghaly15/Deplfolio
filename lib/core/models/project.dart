import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  final String imgPath, title, description;
  final String? downloadLink, promoLink, gitHubLink;

  Project({
    required this.imgPath,
    required this.title,
    required this.description,
    this.downloadLink,
    this.promoLink,
    this.gitHubLink,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
