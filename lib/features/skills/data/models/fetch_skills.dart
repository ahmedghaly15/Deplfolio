import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_skills.g.dart';
part 'fetch_skills.freezed.dart';

@JsonSerializable(explicitToJson: true)
class FetchSkills {
  final String headerSmallText;
  final SkillHeaderTextModel headerBigText;
  final List<SkillModel> skills;

  FetchSkills({
    required this.headerSmallText,
    required this.headerBigText,
    required this.skills,
  });

  factory FetchSkills.fromJson(Map<String, dynamic> json) =>
      _$FetchSkillsFromJson(json);
  Map<String, dynamic> toJson() => _$FetchSkillsToJson(this);
}

@freezed
abstract class SkillModel with _$SkillModel {
  const factory SkillModel({
    required String id,
    required String name,
    @JsonKey(name: 'percentage') required double percent,
  }) = _SkillModel;

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);
}

@JsonSerializable()
class SkillHeaderTextModel {
  final String text1, colorfulString, text3;

  SkillHeaderTextModel({
    required this.text1,
    required this.colorfulString,
    required this.text3,
  });

  factory SkillHeaderTextModel.fromJson(Map<String, dynamic> json) =>
      _$SkillHeaderTextModelFromJson(json);
  Map<String, dynamic> toJson() => _$SkillHeaderTextModelToJson(this);
}
