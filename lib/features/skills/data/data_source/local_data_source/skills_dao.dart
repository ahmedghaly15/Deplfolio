import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;

import '../../../../../core/local_data_source/app_database.dart';
import '../../models/fetch_skills.dart';

final skillsDaoProvider = FutureProvider.autoDispose<SkillsDao>((ref) async {
  final appDatabase = await ref.read(appDatabaseProvider.future);
  return appDatabase.skillsDao;
});

@dao
abstract class SkillsDao {
  @Query('SELECT * FROM Skills')
  Future<FetchSkills?> fetchSkills();

  @insert
  Future<void> insertSkills(FetchSkills skills);

  @Query('DELETE FROM Skills')
  Future<void> deleteAllSkills();
}
