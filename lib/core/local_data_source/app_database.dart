import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;

import '../../features/about/data/data_source.dart/local_data_source/about_dao.dart';
import '../../features/about/data/data_source.dart/local_data_source/dto_converters.dart';
import '../../features/about/data/models/about.dart' show About;

part 'app_database.g.dart';

final appDatabaseProvider = FutureProvider<AppDatabase>((ref) async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  ref.onDispose(database.close);
  return database;
});

@Database(version: 1, entities: [About])
@TypeConverters([
  AboutHeaderTextModelConverter,
  WorkExperienceModelListConverter,
  ApproachModelListConverter,
  ProjectListConverter,
])
abstract class AppDatabase extends FloorDatabase {
  AboutDao get aboutDao;
}
