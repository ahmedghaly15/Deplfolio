import 'fetch_skills.dart' show SkillHeaderTextModel;

class UpdateSkillHeaderTextsParams {
  final String headerSmallText;
  final SkillHeaderTextModel headerBigText;

  UpdateSkillHeaderTextsParams({
    required this.headerSmallText,
    required this.headerBigText,
  });
}
