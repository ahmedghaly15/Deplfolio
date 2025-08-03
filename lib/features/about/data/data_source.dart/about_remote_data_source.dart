import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/data_source/shared_remote_data_source.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/const_strings.dart';
import '../models/about.dart';
import '../models/introduction_section.dart';

final aboutRemoteDataSourceProvider =
    Provider.autoDispose<AboutRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(sharedRemoteDataSourceProvider);
      final supabaseClient = ref.read(supabaseProvider);
      return AboutRemoteDataSourceImpl(remoteDataSource, supabaseClient);
    });

abstract class AboutRemoteDataSource {
  Future<About> fetchAbout();
  Future<void> updateIntroductionSection(IntroductionSection params);
  Future<void> updateWorkExperience(WorkExperienceModel workExperience);
  Future<void> updateApproach(ApproachModel approach);
  Future<void> deleteApproach(String approachId);
}

class AboutRemoteDataSourceImpl implements AboutRemoteDataSource {
  final SharedRemoteDataSource _sharedRemoteDataSource;
  final SupabaseClient _supabaseClient;

  AboutRemoteDataSourceImpl(this._sharedRemoteDataSource, this._supabaseClient);

  @override
  Future<About> fetchAbout() async {
    final portfolioJson =
        await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    final aboutJson = portfolioJson['about'] as Map<String, dynamic>;
    return About.fromJson(aboutJson);
  }

  @override
  Future<void> updateIntroductionSection(IntroductionSection params) async {
    final portfolioJson =
        await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    Map<String, dynamic> aboutJson = portfolioJson['about'];
    aboutJson = {...aboutJson, ...params.toJson()};
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'about': aboutJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  @override
  Future<void> updateWorkExperience(WorkExperienceModel workExperience) async {
    final remoteJson = await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    Map<String, dynamic> aboutJson = remoteJson['about'];
    final workExperiencesJson = aboutJson['workExperience'] as List<dynamic>;
    final workExperienceIndex = workExperiencesJson.indexWhere(
      (we) => we['id'] == workExperience.id,
    );
    workExperiencesJson[workExperienceIndex] = workExperience.toJson();
    aboutJson = {
      ...aboutJson,
      ...{'workExperience': workExperiencesJson},
    };
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'about': aboutJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  @override
  Future<void> updateApproach(ApproachModel approach) async {
    final remoteJson = await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    Map<String, dynamic> aboutJson = remoteJson['about'];
    final approachesJson = aboutJson['approaches'] as List<dynamic>;
    final approachIndex = approachesJson.indexWhere(
      (a) => a['id'] == approach.id,
    );
    approachesJson[approachIndex] = approach.toJson();
    aboutJson = {
      ...aboutJson,
      ...{'approaches': approachesJson},
    };
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'about': aboutJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  @override
  Future<void> deleteApproach(String approachId) async {
    final remoteJson = await _sharedRemoteDataSource.fetchRemotePortfolioJson();
    Map<String, dynamic> aboutJson = remoteJson['about'];
    final approachesJson = aboutJson['approaches'] as List<dynamic>;
    final approachIndex = approachesJson.indexWhere(
      (a) => a['id'] == approachId,
    );
    approachesJson.removeAt(approachIndex);
    aboutJson = {
      ...aboutJson,
      ...{'approaches': approachesJson},
    };
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'about': aboutJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }
}
