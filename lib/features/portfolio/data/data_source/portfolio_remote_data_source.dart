import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../../../../core/models/project.dart';

final portfolioRemoteDataSourceProvider =
    Provider.autoDispose<PortfolioRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(remoteDataSourceProvider);
      return PortfolioRemoteDataSource(remoteDataSource);
    });

class PortfolioRemoteDataSource {
  final RemoteDataSource _remoteDataSource;

  PortfolioRemoteDataSource(this._remoteDataSource);

  Future<List<Project>> fetchPortfolio() async {
    final remoteJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final projectsJson = remoteJson['projects'] as List<Map<String, dynamic>>;
    return projectsJson
        .map((projectJson) => Project.fromJson(projectJson))
        .toList();
  }
}
