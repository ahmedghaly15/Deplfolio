// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as String,
      imgPath: json['imgPath'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      shownInAbout: json['shownInAbout'] as bool,
      downloadLink: json['downloadLink'] as String?,
      promoLink: json['promoLink'] as String?,
      gitHubLink: json['gitHubLink'] as String?,
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgPath': instance.imgPath,
      'title': instance.title,
      'description': instance.description,
      'shownInAbout': instance.shownInAbout,
      'downloadLink': instance.downloadLink,
      'promoLink': instance.promoLink,
      'gitHubLink': instance.gitHubLink,
    };
