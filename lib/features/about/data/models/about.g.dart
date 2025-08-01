// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) => About(
      id: (json['id'] as num?)?.toInt(),
      headerSmallText: json['headerSmallText'] as String,
      headerBigText: AboutHeaderTextModel.fromJson(
          json['headerBigText'] as Map<String, dynamic>),
      description: json['description'] as String,
      seeMyWorkLink: json['seeMyWorkLink'] as String,
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      workExperience: (json['workExperience'] as List<dynamic>)
          .map((e) => WorkExperienceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      approaches: (json['approaches'] as List<dynamic>)
          .map((e) => ApproachModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      'id': instance.id,
      'headerSmallText': instance.headerSmallText,
      'description': instance.description,
      'seeMyWorkLink': instance.seeMyWorkLink,
      'headerBigText': instance.headerBigText.toJson(),
      'projects': instance.projects.map((e) => e.toJson()).toList(),
      'workExperience': instance.workExperience.map((e) => e.toJson()).toList(),
      'approaches': instance.approaches.map((e) => e.toJson()).toList(),
    };

AboutHeaderTextModel _$AboutHeaderTextModelFromJson(
        Map<String, dynamic> json) =>
    AboutHeaderTextModel(
      text1: json['text1'] as String,
      text2: json['text2'] as String,
      coloredString: json['coloredString'] as String,
    );

Map<String, dynamic> _$AboutHeaderTextModelToJson(
        AboutHeaderTextModel instance) =>
    <String, dynamic>{
      'text1': instance.text1,
      'text2': instance.text2,
      'coloredString': instance.coloredString,
    };

ApproachModel _$ApproachModelFromJson(Map<String, dynamic> json) =>
    ApproachModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ApproachModelToJson(ApproachModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };

_$WorkExperienceModelImpl _$$WorkExperienceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkExperienceModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      company: json['company'] as String,
      experienceStatus:
          $enumDecode(_$ExperienceStatusEnumMap, json['experienceStatus']),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$WorkExperienceModelImplToJson(
        _$WorkExperienceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'company': instance.company,
      'experienceStatus': _$ExperienceStatusEnumMap[instance.experienceStatus]!,
      'description': instance.description,
    };

const _$ExperienceStatusEnumMap = {
  ExperienceStatus.fullTime: 'Full-time',
  ExperienceStatus.partTime: 'Part-time',
  ExperienceStatus.remote: 'Remote',
  ExperienceStatus.freelance: 'Freelance',
  ExperienceStatus.internship: 'Internship',
};
