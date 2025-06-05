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
    final projectIndex = projectsJson.indexWhere(
      (p) => p['title'] == project.title,
    );
    projectsJson[projectIndex] = project.toJson();
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'portfolio': projectsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }
}
