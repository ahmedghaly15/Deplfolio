import 'dart:developer' show log;

import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;

import '../../features/about/data/data_source.dart/local_data_source/about_dao.dart'
    show aboutDaoProvider;
import '../../features/about/presentation/providers/fetch_about_provider.dart';

class LocalDataRefresher {
  LocalDataRefresher._();

  static Future<void> refreshAbout(WidgetRef ref) async {
    final aboutDao = await ref.read(aboutDaoProvider.future);
    await aboutDao.deleteAll();
    log('DELETED ALL ABOUT FROM LOCAL DB');
    ref.invalidate(fetchAboutProvider);
  }
}
