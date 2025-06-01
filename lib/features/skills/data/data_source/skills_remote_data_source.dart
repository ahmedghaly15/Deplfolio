import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../models/fetch_skills.dart';

final skillsRemoteDataSourceProvider =
    Provider.autoDispose<SkillsRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(remoteDataSourceProvider);
      return SkillsRemoteDataSource(remoteDataSource);
    });

class SkillsRemoteDataSource {
  final RemoteDataSource _remoteDataSource;

  SkillsRemoteDataSource(this._remoteDataSource);

  Future<FetchSkills> fetchSkills() async {
    final portfolioJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final skillsJson = portfolioJson['skills'] as Map<String, dynamic>;
    return FetchSkills.fromJson(skillsJson);
  }
}
