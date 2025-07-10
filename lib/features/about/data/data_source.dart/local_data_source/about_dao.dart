import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;

import '../../../../../core/local_data_source/app_database.dart';
import '../../models/about.dart' show About;

final aboutDaoProvider = FutureProvider.autoDispose<AboutDao>((ref) async {
  final database = await ref.read(appDatabaseProvider.future);
  return database.aboutDao;
});

@dao
abstract class AboutDao {
  @Query('SELECT * FROM About')
  Future<About?> fetchAbout();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAbout(About about);

  @Query('DELETE FROM About')
  Future<void> deleteAll();
}
