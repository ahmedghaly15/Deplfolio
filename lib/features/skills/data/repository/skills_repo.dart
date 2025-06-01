import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/supabase/supabase_request_result.dart';
import '../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data/data_source/skills_remote_data_source.dart';
import '../data/models/fetch_skills.dart';

final skillsRepoProvider = Provider.autoDispose<SkillsRepo>((ref) {
  final remoteDataSource = ref.read(skillsRemoteDataSourceProvider);
  return SkillsRepo(remoteDataSource);
});

class SkillsRepo {
  final SkillsRemoteDataSource _remoteDataSource;

  SkillsRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<FetchSkills>> fetchSkills(Ref ref) {
    return executeAndHandleErrors(
      ref,
      () async => await _remoteDataSource.fetchSkills(),
    );
  }
}
