import 'dart:developer' show log;

import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;

import '../../features/about/data/data_source.dart/local_data_source/about_dao.dart'
    show aboutDaoProvider;
import '../../features/about/presentation/providers/fetch_about_provider.dart';
import '../../features/portfolio/data/data_source/local_data_source/project_dao.dart'
    show projectDaoProvider;
import '../../features/portfolio/presentation/providers/fetch_portfolio_provider.dart';
import '../../features/skills/data/data_source/local_data_source/skills_dao.dart';
import '../../features/skills/presentation/provider/fetch_skills_providers.dart';

class LocalDataRefresher {
  LocalDataRefresher._();

  static Future<void> refreshAboutProvider(WidgetRef ref) async {
    final aboutDao = await ref.read(aboutDaoProvider.future);
    await aboutDao.deleteAll();
    log('DELETED ALL ABOUT FROM LOCAL DB & REFRESHED ABOUT PROVIDER');
    ref.invalidate(fetchAboutProvider);
  }

  static Future<void> refreshSkillsProvider(WidgetRef ref) async {
    final skillsDao = await ref.read(skillsDaoProvider.future);
    await skillsDao.deleteAllSkills();
    log('DELETED ALL SKILLS FROM LOCAL DB & REFRESHED SKILLS PROVIDER');
    ref.invalidate(fetchSkillsProvider);
  }

  static Future<void> refreshPortfolioProvider(WidgetRef ref) async {
    final projectDao = await ref.read(projectDaoProvider.future);
    await projectDao.deleteProjects();
    log('DELETED ALL PROJECTS FROM LOCAL DB & REFRESHED PORTFOLIO PROVIDER');
    ref.invalidate(fetchPortfolioProvider);
  }
}
