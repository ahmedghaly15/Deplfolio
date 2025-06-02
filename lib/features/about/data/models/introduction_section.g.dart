// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'introduction_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroductionSection _$IntroductionSectionFromJson(Map<String, dynamic> json) =>
    IntroductionSection(
      headerSmallText: json['headerSmallText'] as String,
      description: json['description'] as String,
      seeMyWorkLink: json['seeMyWorkLink'] as String,
      headerBigText: AboutHeaderTextModel.fromJson(
        json['headerBigText'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$IntroductionSectionToJson(
  IntroductionSection instance,
) => <String, dynamic>{
  'headerSmallText': instance.headerSmallText,
  'description': instance.description,
  'seeMyWorkLink': instance.seeMyWorkLink,
  'headerBigText': instance.headerBigText.toJson(),
};
