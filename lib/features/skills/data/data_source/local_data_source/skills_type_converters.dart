import 'dart:convert';

import 'package:floor/floor.dart' show TypeConverter;

import '../../models/fetch_skills.dart';

class SkillHeaderTextModelConverter
    extends TypeConverter<SkillHeaderTextModel, String> {
  @override
  SkillHeaderTextModel decode(String sqlValue) {
    final json = jsonDecode(sqlValue) as Map<String, dynamic>;
    return SkillHeaderTextModel.fromJson(json);
  }

  @override
  String encode(SkillHeaderTextModel value) {
    final json = value.toJson();
    return jsonEncode(json);
  }
}

class SkillsListTypeConverter extends TypeConverter<List<SkillModel>, String> {
  @override
  List<SkillModel> decode(String sqlValue) {
    final jsonList = jsonDecode(sqlValue) as List<dynamic>;
    return jsonList
        .map((json) => SkillModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  String encode(List<SkillModel> value) {
    final jsonList = value.map((skill) => skill.toJson()).toList();
    return jsonEncode(jsonList);
  }
}
