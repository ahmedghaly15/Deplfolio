import 'dart:convert';

import 'package:floor/floor.dart' show TypeConverter;

import '../../../../../core/models/project.dart';

class ProjectConverter extends TypeConverter<Project, String> {
  @override
  Project decode(String databaseValue) =>
      Project.fromJson(jsonDecode(databaseValue));

  @override
  String encode(Project value) => jsonEncode(value.toJson());
}
