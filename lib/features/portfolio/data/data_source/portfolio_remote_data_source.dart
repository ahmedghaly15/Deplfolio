import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/const_strings.dart';

final portfolioRemoteDataSourceProvider =
    Provider.autoDispose<PortfolioRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(remoteDataSourceProvider);
      final supabaseClient = ref.read(supabaseProvider);
      return PortfolioRemoteDataSource(remoteDataSource, supabaseClient);
    });

class PortfolioRemoteDataSource {
  final RemoteDataSource _remoteDataSource;
  final SupabaseClient _supabaseClient;

  PortfolioRemoteDataSource(this._remoteDataSource, this._supabaseClient);

  Future<List<Project>> fetchPortfolio() async {
    final remoteJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final projectsJson = remoteJson['portfolio'] as List<dynamic>;
    return projectsJson
        .map((projectJson) => Project.fromJson(projectJson))
        .toList();
  }

  Future<void> updateProject(Project project) async {
    final remoteJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final projectsJson = remoteJson['portfolio'] as List<dynamic>;
    final projectIndex = projectsJson.indexWhere((p) => p['id'] == project.id);
    projectsJson[projectIndex] = project.toJson();
    Map<String, dynamic> aboutJson = remoteJson['about'];
    aboutJson = {
      ...aboutJson,
      ...{'projects': projectsJson},
    };
    // Because They don't depend on each other, Run both updates concurrently
    await Future.wait([
      _updateProjectInPortfolio(projectsJson),
      _updateProjectInAbout(aboutJson),
    ]);
  }

  Future<void> _updateProjectInAbout(Map<String, dynamic> aboutJson) async {
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'about': aboutJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  Future<void> _updateProjectInPortfolio(List<dynamic> projectsJson) async {
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'portfolio': projectsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  Future<void> showOrHideProjectFromAbout(String projectTitle) async {
    final remoteJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final projectsJson = remoteJson['portfolio'] as List<dynamic>;
    final projectIndex = projectsJson.indexWhere(
      (p) => p['title'] == projectTitle,
    );
    final shownInAbout = projectsJson[projectIndex]['shownInAbout'] as bool;
    projectsJson[projectIndex]['shownInAbout'] = !shownInAbout;
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'portfolio': projectsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }
}
