import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../models/login_request_params.dart';

final loginRemoteDataSourceProvider =
    Provider.autoDispose<LoginRemoteDataSource>((ref) {
      final supabaseClient = ref.read(supabaseProvider);
      return LoginRemoteDataSourceImpl(supabaseClient);
    });

abstract class LoginRemoteDataSource {
  Future<String> signInWithEmailAndPassword(LoginRequestParams params);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final SupabaseClient _supabaseClient;

  LoginRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<String> signInWithEmailAndPassword(LoginRequestParams params) async {
    final authResponse = await _supabaseClient.auth.signInWithPassword(
      email: params.email,
      password: params.password,
    );
    return authResponse.user!.id;
  }
}
