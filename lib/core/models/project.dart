import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
abstract class Project with _$Project {
  @JsonSerializable()
  const factory Project({
    required String id,
    required String imgPath,
    required String title,
    required String description,
    required bool shownInAbout,
    String? downloadLink,
    String? promoLink,
    String? gitHubLink,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
