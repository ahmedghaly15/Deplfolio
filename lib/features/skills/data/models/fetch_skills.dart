import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../data_source/local_data_source/skills_type_converters.dart';

part 'fetch_skills.g.dart';

@Entity(tableName: 'Skills')
@TypeConverters([SkillsListTypeConverter, SkillHeaderTextModelConverter])
@JsonSerializable(explicitToJson: true)
class FetchSkills {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String headerSmallText;
  final SkillHeaderTextModel headerBigText;
  final List<SkillModel> skills;

  FetchSkills({
    this.id,
    required this.headerSmallText,
    required this.headerBigText,
    required this.skills,
  });

  factory FetchSkills.fromJson(Map<String, dynamic> json) =>
      _$FetchSkillsFromJson(json);
  Map<String, dynamic> toJson() => _$FetchSkillsToJson(this);
}

@JsonSerializable()
class SkillModel {
  final String id, name;
  @JsonKey(name: 'percentage')
  final double percent;

  SkillModel({required this.id, required this.name, required this.percent});

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);
  Map<String, dynamic> toJson() => _$SkillModelToJson(this);
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
