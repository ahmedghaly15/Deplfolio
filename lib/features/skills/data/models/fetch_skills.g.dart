// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_skills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchSkills _$FetchSkillsFromJson(Map<String, dynamic> json) => FetchSkills(
      id: (json['id'] as num?)?.toInt(),
      headerSmallText: json['headerSmallText'] as String,
      headerBigText: SkillHeaderTextModel.fromJson(
          json['headerBigText'] as Map<String, dynamic>),
      skills: (json['skills'] as List<dynamic>)
          .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchSkillsToJson(FetchSkills instance) =>
    <String, dynamic>{
      'id': instance.id,
      'headerSmallText': instance.headerSmallText,
      'headerBigText': instance.headerBigText.toJson(),
      'skills': instance.skills.map((e) => e.toJson()).toList(),
    };

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) => SkillModel(
      id: json['id'] as String,
      name: json['name'] as String,
      percent: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$SkillModelToJson(SkillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentage': instance.percent,
    };

SkillHeaderTextModel _$SkillHeaderTextModelFromJson(
        Map<String, dynamic> json) =>
    SkillHeaderTextModel(
      text1: json['text1'] as String,
      colorfulString: json['colorfulString'] as String,
      text3: json['text3'] as String,
    );

Map<String, dynamic> _$SkillHeaderTextModelToJson(
        SkillHeaderTextModel instance) =>
    <String, dynamic>{
      'text1': instance.text1,
      'colorfulString': instance.colorfulString,
      'text3': instance.text3,
    };
