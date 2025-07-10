import 'package:floor/floor.dart';

import 'project_type_converter.dart';

@Entity(tableName: 'Portfolio')
@TypeConverters([ProjectEntityListConverter])
class ProjectEntity {
  @primaryKey
  final String id;
  final String imgPath;
  final String title;
  final String description;
  final bool shownInAbout;
  final String? downloadLink;
  final String? promoLink;
  final String? gitHubLink;

  ProjectEntity({
    required this.id,
    required this.imgPath,
    required this.title,
    required this.description,
    required this.shownInAbout,
    this.downloadLink,
    this.promoLink,
    this.gitHubLink,
  });
}
