import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/supabase_execute_and_handle_errors.dart';
import '../data_source/skills_remote_data_source.dart';
import '../models/fetch_skills.dart';
import '../models/skills_texts.dart';

final skillsRepoProvider = Provider.autoDispose<SkillsRepo>((ref) {
  final remoteDataSource = ref.read(skillsRemoteDataSourceProvider);
  return SkillsRepo(remoteDataSource);
});

class SkillsRepo {
  final SkillsRemoteDataSource _remoteDataSource;

  SkillsRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<FetchSkills>> fetchSkills(Ref ref) {
    return supabaseExecuteAndHandleErrors(
      ref,
      () async => await _remoteDataSource.fetchSkills(),
    );
  }

  Future<SupabaseRequestResult<void>> updateSkillHeader(
    Ref ref,
    SkillsTexts params,
  ) {
    return supabaseExecuteAndHandleErrors<void>(
      ref,
      () async => await _remoteDataSource.updateSkillHeader(params),
    );
  }

  Future<SupabaseRequestResult<void>> updateSkill(Ref ref, SkillModel skill) {
    return supabaseExecuteAndHandleErrors<void>(
      ref,
      () async => await _remoteDataSource.updateSkill(skill),
    );
  }

  Future<SupabaseRequestResult<void>> addSkill(Ref ref, SkillModel skill) {
    return supabaseExecuteAndHandleErrors<void>(
      ref,
      () async => await _remoteDataSource.addSkill(skill),
    );
  }

  Future<SupabaseRequestResult<void>> deleteSkill(Ref ref, String skillId) {
    return supabaseExecuteAndHandleErrors<void>(
      ref,
      () async => await _remoteDataSource.deleteSkill(skillId),
    );
  }
}
