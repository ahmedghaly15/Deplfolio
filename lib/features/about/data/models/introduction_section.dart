import 'package:json_annotation/json_annotation.dart';

import 'about.dart';

part 'introduction_section.g.dart';

@JsonSerializable(explicitToJson: true)
class IntroductionSection {
  final String headerSmallText, description, seeMyWorkLink;
  final AboutHeaderTextModel headerBigText;

  IntroductionSection({
    required this.headerSmallText,
    required this.description,
    required this.seeMyWorkLink,
    required this.headerBigText,
  });

  factory IntroductionSection.fromJson(Map<String, dynamic> json) =>
      _$IntroductionSectionFromJson(json);
  Map<String, dynamic> toJson() => _$IntroductionSectionToJson(this);
}
