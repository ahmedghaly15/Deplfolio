import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;

import '../../../../../core/local_data_source/app_database.dart'
    show appDatabaseProvider;
import 'project_entity.dart';

final projectDaoProvider = FutureProvider.autoDispose<ProjectDao>((ref) async {
  final database = await ref.read(appDatabaseProvider.future);
  return database.projectDao;
});

@dao
abstract class ProjectDao {
  @Query('SELECT * FROM Portfolio')
  Future<List<ProjectEntity>?> fetchProjects();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProject(ProjectEntity project);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProjects(List<ProjectEntity> projects);

  @Query('DELETE FROM Portfolio')
  Future<void> deleteProjects();
}
