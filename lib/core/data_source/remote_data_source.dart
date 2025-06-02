import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../supabase/supabase_request_result.dart';
import '../utils/app_utils.dart';
import '../utils/const_strings.dart';

final remoteDataSourceProvider = Provider.autoDispose<RemoteDataSource>((ref) {
  final supabaseClient = ref.read(supabaseProvider);
  return RemoteDataSource(supabaseClient);
});

class RemoteDataSource {
  final SupabaseClient _supabaseClient;

  RemoteDataSource(this._supabaseClient);

  Future<Map<String, dynamic>> fetchRemotePortfolioJson() async {
    return await _supabaseClient
        .from(ConstStrings.dataTable)
        .select()
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!)
        .single();
  }
}
