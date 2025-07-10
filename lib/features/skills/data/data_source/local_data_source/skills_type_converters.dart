import 'dart:convert';

import 'package:floor/floor.dart' show TypeConverter;

import '../../models/fetch_skills.dart';

class SkillHeaderTextModelConverter
    extends TypeConverter<SkillHeaderTextModel, String> {
  @override
  SkillHeaderTextModel decode(String sqlValue) =>
      SkillHeaderTextModel.fromJson(jsonDecode(sqlValue));

  @override
  String encode(SkillHeaderTextModel value) => jsonEncode(value.toJson());
}

class SkillsListTypeConverter extends TypeConverter<List<SkillModel>, String> {
  @override
  List<SkillModel> decode(String sqlValue) =>
      (jsonDecode(sqlValue) as List)
          .map((e) => SkillModel.fromJson(e))
          .toList();

  @override
  String encode(List<SkillModel> value) =>
      jsonEncode(value.map((e) => e.toJson()).toList());
}
