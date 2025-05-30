import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../data_source/login_remote_data_source.dart';
import '../models/login_request_params.dart';

final loginRepoProvider = Provider.autoDispose<LoginRepo>((ref) {
  final loginRemoteDataSource = ref.watch(loginRemoteDataSourceProvider);
  return LoginRepo(loginRemoteDataSource);
});

class LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepo(this._loginRemoteDataSource);

  Future<SupabaseRequestResult<String>> loginViaEmailAndPass(
    Ref ref,
    LoginRequestParams params,
  ) {
    return executeAndHandleErrors(ref, () async {
      return await _loginRemoteDataSource.signInWithEmailAndPassword(params);
    });
  }
}
