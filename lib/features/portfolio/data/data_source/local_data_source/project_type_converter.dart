import 'dart:convert';

import 'package:deplfolio/core/helpers/extensions.dart';
import 'package:floor/floor.dart' show TypeConverter;

import '../../../../../core/models/project.dart';

import 'project_entity.dart';

class ProjectEntityListConverter
    extends TypeConverter<List<ProjectEntity>, String> {
  @override
  List<ProjectEntity> decode(String databaseValue) {
    final List<dynamic> decodedJson = jsonDecode(databaseValue);
    return decodedJson
        .map(
          (json) =>
              Project.fromJson(json as Map<String, dynamic>).toProjectEntity(),
        )
        .toList();
  }

  @override
  String encode(List<ProjectEntity> value) {
    final List<Map<String, dynamic>> jsonList =
        value.map((e) => e.toProjectModel(e).toJson()).toList();
    return jsonEncode(jsonList);
  }
}
