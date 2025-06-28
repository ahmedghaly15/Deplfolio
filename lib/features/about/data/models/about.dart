import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:floor/floor.dart';

import '../../../../core/enums/experience_status.dart';
import '../../../../core/models/project.dart';
import '../data_source.dart/local_data_source/about_type_converters.dart';

part 'about.g.dart';
part 'about.freezed.dart';

@entity
@TypeConverters([
  AboutHeaderTextModelConverter,
  WorkExperienceModelListConverter,
  ApproachModelListConverter,
  ProjectListConverter,
])
@JsonSerializable(explicitToJson: true)
class About {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String headerSmallText, description, seeMyWorkLink;
  final AboutHeaderTextModel headerBigText;
  final List<Project> projects;
  final List<WorkExperienceModel> workExperience;
  final List<ApproachModel> approaches;

  About({
    this.id,
    required this.headerSmallText,
    required this.headerBigText,
    required this.description,
    required this.seeMyWorkLink,
    required this.projects,
    required this.workExperience,
    required this.approaches,
  });

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);
  Map<String, dynamic> toJson() => _$AboutToJson(this);
}

@JsonSerializable()
class AboutHeaderTextModel {
  final String text1, text2, coloredString;

  AboutHeaderTextModel({
    required this.text1,
    required this.text2,
    required this.coloredString,
  });

  factory AboutHeaderTextModel.fromJson(Map<String, dynamic> json) =>
      _$AboutHeaderTextModelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutHeaderTextModelToJson(this);
}

@freezed
abstract class WorkExperienceModel with _$WorkExperienceModel {
  const factory WorkExperienceModel({
    required String id,
    required String title,
    required String startDate,
    required String endDate,
    required String company,
    required ExperienceStatus experienceStatus,
    required String description,
  }) = _WorkExperienceModel;

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceModelFromJson(json);
}

@JsonSerializable()
class ApproachModel {
  final String id, title, description;

  ApproachModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory ApproachModel.fromJson(Map<String, dynamic> json) =>
      _$ApproachModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApproachModelToJson(this);
}
