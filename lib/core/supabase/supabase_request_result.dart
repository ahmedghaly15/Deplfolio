import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_error.dart';

part 'supabase_request_result.freezed.dart';

final supabaseProvider = Provider.autoDispose<SupabaseClient>(
  (ref) => Supabase.instance.client,
);

@freezed
sealed class SupabaseRequestResult<T> with _$SupabaseRequestResult<T> {
  const factory SupabaseRequestResult.success(T data) =
      SupabaseRequestSuccess<T>;
  const factory SupabaseRequestResult.failure(SupabaseError errorModel) =
      SupabaseRequestFailure<T>;
}
