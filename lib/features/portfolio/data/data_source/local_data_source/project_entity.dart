import 'package:floor/floor.dart';

import '../../../../about/data/data_source.dart/local_data_source/about_type_converters.dart'
    show ProjectListConverter;

@entity
@TypeConverters([ProjectListConverter])
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
