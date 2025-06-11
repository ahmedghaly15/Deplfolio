import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/data_source/remote_data_source.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/const_strings.dart';
import '../models/about.dart';
import '../models/introduction_section.dart';

final aboutRemoteDataSourceProvider =
    Provider.autoDispose<AboutRemoteDataSource>((ref) {
      final remoteDataSource = ref.read(remoteDataSourceProvider);
      final supabaseClient = ref.read(supabaseProvider);
      return AboutRemoteDataSource(remoteDataSource, supabaseClient);
    });

class AboutRemoteDataSource {
  final RemoteDataSource _remoteDataSource;
  final SupabaseClient _supabaseClient;

  AboutRemoteDataSource(this._remoteDataSource, this._supabaseClient);

  Future<About> fetchAbout() async {
    final portfolioJson = await _remoteDataSource.fetchRemotePortfolioJson();
    final aboutJson = portfolioJson['about'] as Map<String, dynamic>;
    return About.fromJson(aboutJson);
  }

  Future<void> updateIntroductionSection(IntroductionSection params) async {
    final portfolioJson = await _remoteDataSource.fetchRemotePortfolioJson();
    Map<String, dynamic> aboutJson = portfolioJson['about'];
    aboutJson = {...aboutJson, ...params.toJson()};
    await _supabaseClient
        .from(ConstStrings.dataTable)
        .update({'about': aboutJson})
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!);
  }

  Future<void> updateWorkExperience(WorkExperienceModel workExperience) async {
    final remoteJson = await _remoteDataSource.fetchRemotePortfolioJson();
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
}
