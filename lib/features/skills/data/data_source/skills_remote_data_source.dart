import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/data_source/shared_remote_data_source.dart';
import '../../../../core/supabase/supabase_request_result.dart'
    show supabaseProvider;
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/const_strings.dart';
import '../models/fetch_skills.dart';
import '../models/skills_texts.dart';

final skillsRemoteDataSourceProvider =
    Provider.autoDispose<SkillsRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(sharedRemoteDataSourceProvider);
      final supabaseClient = ref.read(supabaseProvider);
      return SkillsRemoteDataSourceImpl(remoteDataSource, supabaseClient);
    });

abstract class SkillsRemoteDataSource {
  Future<FetchSkills> fetchSkills();

  Future<void> updateSkillHeader(SkillsTexts params);

  Future<void> updateSkill(SkillModel skill);

  Future<void> addSkill(SkillModel skill);

  Future<void> deleteSkill(String skillId);
}

class SkillsRemoteDataSourceImpl implements SkillsRemoteDataSource {
  final SharedRemoteDataSource _sharedRemoteDataSource;
  final SupabaseClient _supabaseClient;

  SkillsRemoteDataSourceImpl(
    this._sharedRemoteDataSource,
    this._supabaseClient,
  );

  @override
  Future<FetchSkills> fetchSkills() async {
    final portfolioJson =
        await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    final skillsJson = portfolioJson['skills'] as Map<String, dynamic>;
    return FetchSkills.fromJson(skillsJson);
  }

  @override
  Future<void> updateSkillHeader(SkillsTexts params) async {
    final portfolioJson =
        await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    final fetchSkillsJson = portfolioJson['skills'];
    fetchSkillsJson['headerSmallText'] = params.headerSmallText;
    fetchSkillsJson['headerBigText'] = params.headerBigText.toJson();
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'skills': fetchSkillsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  @override
  Future<void> updateSkill(SkillModel skill) async {
    final portfolioJson =
        await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    Map<String, dynamic> fetchSkillsJson = portfolioJson['skills'];
    final skillsListJson = fetchSkillsJson['skills'] as List<dynamic>;
    final skillIndex = skillsListJson.indexWhere(
      (json) => json['id'] == skill.id,
    );
    skillsListJson[skillIndex] = skill.toJson();
    fetchSkillsJson = {
      ...fetchSkillsJson,
      ...{'skills': skillsListJson},
    };
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'skills': fetchSkillsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  @override
  Future<void> addSkill(SkillModel skill) async {
    final portfolioJson =
        await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    Map<String, dynamic> fetchSkillsJson = portfolioJson['skills'];
    final skillsListJson = fetchSkillsJson['skills'] as List<dynamic>;
    skillsListJson.add(skill.toJson());
    fetchSkillsJson = {
      ...fetchSkillsJson,
      ...{'skills': skillsListJson},
    };
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'skills': fetchSkillsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  @override
  Future<void> deleteSkill(String skillId) async {
    final portfolioJson =
        await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    Map<String, dynamic> fetchSkillsJson = portfolioJson['skills'];
    final skillsListJson = fetchSkillsJson['skills'] as List<dynamic>;
    final skillIndex = skillsListJson.indexWhere(
      (json) => json['id'] == skillId,
    );
    skillsListJson.removeAt(skillIndex);
    fetchSkillsJson = {
      ...fetchSkillsJson,
      ...{'skills': skillsListJson},
    };
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'skills': fetchSkillsJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }
}
