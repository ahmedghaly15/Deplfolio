import 'dart:developer' show log;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/supabase_execute_and_handle_errors.dart';
import '../data_source/local_data_source/skills_dao.dart'
    show skillsDaoProvider;
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

  Future<SupabaseRequestResult<FetchSkills>> fetchSkills(Ref ref) async {
    final skillsDao = await ref.read(skillsDaoProvider.future);
    final cachedSkills = await skillsDao.fetchSkills();
    if (cachedSkills != null) {
      log('FETCHED CACHED SKILLS FROM LOCAL DB');
      return SupabaseRequestResult.success(cachedSkills);
    } else {
      return supabaseExecuteAndHandleErrors(ref, () async {
        final skills = await _remoteDataSource.fetchSkills();
        await skillsDao.insertSkills(skills);
        log('FETCHED SKILLS FROM REMOTE SOURCE AND SAVED TO LOCAL DB');
        return skills;
      });
    }
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
