import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_source.dart/about_remote_data_source.dart';
import '../models/about.dart';
import '../models/introduction_section.dart';

final aboutRepoProvider = Provider.autoDispose<AboutRepo>((ref) {
  final remoteDataSource = ref.read(aboutRemoteDataSourceProvider);
  return AboutRepo(remoteDataSource);
});

class AboutRepo {
  final AboutRemoteDataSource _remoteDataSource;

  AboutRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<About>> fetchAbout(Ref ref) {
    return executeAndHandleErrors(
      ref,
      () async => await _remoteDataSource.fetchAbout(),
    );
  }

  Future<SupabaseRequestResult<void>> updateIntroductionSection(
    Ref ref,
    IntroductionSection params,
  ) {
    return executeAndHandleErrors(
      ref,
      () async => await _remoteDataSource.updateIntroductionSection(params),
    );
  }
}
