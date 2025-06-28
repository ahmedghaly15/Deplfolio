import 'dart:convert';

import 'package:floor/floor.dart' show TypeConverter;

import '../../../../../core/models/project.dart';
import '../../models/about.dart'
    show AboutHeaderTextModel, ApproachModel, WorkExperienceModel;

class AboutHeaderTextModelConverter
    extends TypeConverter<AboutHeaderTextModel, String> {
  @override
  AboutHeaderTextModel decode(String databaseValue) =>
      AboutHeaderTextModel.fromJson(jsonDecode(databaseValue));

  @override
  String encode(AboutHeaderTextModel value) => jsonEncode(value.toJson());
}

class WorkExperienceModelListConverter
    extends TypeConverter<List<WorkExperienceModel>, String> {
  @override
  List<WorkExperienceModel> decode(String databaseValue) =>
      (jsonDecode(databaseValue) as List)
          .map((e) => WorkExperienceModel.fromJson(e))
          .toList();

  @override
  String encode(List<WorkExperienceModel> value) =>
      jsonEncode(value.map((e) => e.toJson()).toList());
}

class ApproachModelListConverter
    extends TypeConverter<List<ApproachModel>, String> {
  @override
  List<ApproachModel> decode(String databaseValue) =>
      (jsonDecode(databaseValue) as List)
          .map((e) => ApproachModel.fromJson(e))
          .toList();

  @override
  String encode(List<ApproachModel> value) =>
      jsonEncode(value.map((e) => e.toJson()).toList());
}

class ProjectListConverter extends TypeConverter<List<Project>, String> {
  @override
  List<Project> decode(String databaseValue) =>
      (jsonDecode(databaseValue) as List)
          .map((e) => Project.fromJson(e))
          .toList();

  @override
  String encode(List<Project> value) =>
      jsonEncode(value.map((e) => e.toJson()).toList());
}
