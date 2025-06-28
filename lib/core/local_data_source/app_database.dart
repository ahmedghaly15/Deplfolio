import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;

import '../../features/about/data/data_source.dart/local_data_source/about_dao.dart';
import '../../features/about/data/data_source.dart/local_data_source/about_type_converters.dart';
import '../../features/about/data/models/about.dart' show About;
import '../../features/portfolio/data/data_source/local_data_source/project_dao.dart';
import '../../features/portfolio/data/data_source/local_data_source/project_entity.dart';
import '../../features/portfolio/data/data_source/local_data_source/project_type_converter.dart';
import '../../features/skills/data/data_source/local_data_source/skills_dao.dart';
import '../../features/skills/data/data_source/local_data_source/skills_type_converters.dart';
import '../../features/skills/data/models/fetch_skills.dart' show FetchSkills;

part 'app_database.g.dart';

final appDatabaseProvider = FutureProvider<AppDatabase>((ref) async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  ref.onDispose(database.close);
  return database;
});

@Database(version: 1, entities: [About, FetchSkills, ProjectEntity])
@TypeConverters([
  AboutHeaderTextModelConverter,
  WorkExperienceModelListConverter,
  ApproachModelListConverter,
  ProjectListConverter,
  SkillsListTypeConverter,
  SkillHeaderTextModelConverter,
  ProjectConverter,
])
abstract class AppDatabase extends FloorDatabase {
  AboutDao get aboutDao;
  SkillsDao get skillsDao;
  ProjectDao get projectDao;
}
