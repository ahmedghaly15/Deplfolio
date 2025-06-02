import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/project.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/supabase_execute_and_handle_errors.dart';
import '../data_source/portfolio_remote_data_source.dart';

final portfolioRepoProvider = Provider.autoDispose<PortfolioRepo>((ref) {
  final remoteDataSource = ref.read(portfolioRemoteDataSourceProvider);
  return PortfolioRepo(remoteDataSource);
});

class PortfolioRepo {
  final PortfolioRemoteDataSource _remoteDataSource;

  PortfolioRepo(this._remoteDataSource);

  Future<SupabaseRequestResult<List<Project>>> fetchPortfolio(Ref ref) {
    return supabaseExecuteAndHandleErrors<List<Project>>(
      ref,
      () async => await _remoteDataSource.fetchPortfolio(),
    );
  }
}
