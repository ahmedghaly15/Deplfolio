import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/supabase_execute_and_handle_errors.dart';
import '../data_source.dart/about_remote_data_source.dart';
import '../data_source.dart/local_data_source/about_dao.dart';
import '../models/about.dart';
import '../models/introduction_section.dart';

final aboutRepoProvider = Provider.autoDispose<AboutRepo>((ref) {
  final remoteDataSource = ref.read(aboutRemoteDataSourceProvider);
  return AboutRepo(remoteDataSource);
});

class AboutRepo {
  final AboutRemoteDataSource _remoteDataSource;

  AboutRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<About>> fetchAbout(Ref ref) async {
    final aboutDao = await ref.read(aboutDaoProvider.future);
    final cachedAbout = await aboutDao.fetchAbout();
    if (cachedAbout != null) {
      return SupabaseRequestResult.success(cachedAbout);
    } else {
      return supabaseExecuteAndHandleErrors(ref, () async {
        final about = await _remoteDataSource.fetchAbout();
        await aboutDao.insertAbout(about);
        return about;
      });
    }
  }

  Future<SupabaseRequestResult<void>> updateIntroductionSection(
    Ref ref,
    IntroductionSection params,
  ) {
    return supabaseExecuteAndHandleErrors(
      ref,
      () async => await _remoteDataSource.updateIntroductionSection(params),
    );
  }

  Future<SupabaseRequestResult<void>> updateWorkExperience(
    Ref ref,
    WorkExperienceModel workExperience,
  ) {
    return supabaseExecuteAndHandleErrors(
      ref,
      () async => await _remoteDataSource.updateWorkExperience(workExperience),
    );
  }

  Future<SupabaseRequestResult<void>> updateApproach(
    Ref ref,
    ApproachModel approach,
  ) {
    return supabaseExecuteAndHandleErrors(
      ref,
      () async => await _remoteDataSource.updateApproach(approach),
    );
  }

  Future<SupabaseRequestResult<void>> deleteApproach(
    Ref ref,
    String approachId,
  ) {
    return supabaseExecuteAndHandleErrors(
      ref,
      () async => await _remoteDataSource.deleteApproach(approachId),
    );
  }
}
