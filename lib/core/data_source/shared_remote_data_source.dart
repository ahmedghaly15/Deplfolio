import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../supabase/supabase_request_result.dart';
import '../utils/app_utils.dart';
import '../utils/const_strings.dart';

final sharedRemoteDataSourceProvider =
    Provider.autoDispose<SharedRemoteDataSource>((ref) {
      final supabaseClient = ref.read(supabaseProvider);
      return SharedRemoteDataSourceImpl(supabaseClient);
    });

abstract class SharedRemoteDataSource {
  Future<Map<String, dynamic>> fetchRemotePortfolioJson();
}

class SharedRemoteDataSourceImpl implements SharedRemoteDataSource {
  final SupabaseClient _supabaseClient;

  SharedRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<Map<String, dynamic>> fetchRemotePortfolioJson() async {
    return await _supabaseClient
        .from(ConstStrings.dataTable)
        .select()
        .eq(ConstStrings.tableEqualityKey, AppUtils.userId!)
        .single();
  }
}
