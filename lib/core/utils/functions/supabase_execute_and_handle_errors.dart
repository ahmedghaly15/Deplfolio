import 'dart:developer' show log;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../network/internet_checker.dart';
import '../../supabase/supabase_error_handler.dart';
import '../../supabase/supabase_request_result.dart';
import '../app_strings.dart';

Future<SupabaseRequestResult<T>> supabaseExecuteAndHandleErrors<T>(
  Ref ref,
  Future<T> Function() function,
) async {
  final internetChecker = ref.read(internetCheckerProvider);
  if (await internetChecker.isConnected) {
    try {
      final response = await function();
      return SupabaseRequestResult<T>.success(response);
    } catch (error) {
      log('>>>>>>>>> CATCHED IN executeAndHandleErrors: $error <<<<<<<<<<');
      return SupabaseRequestResult.failure(
        SupabaseErrorHandler.handleError(error),
      );
    }
  } else {
    return SupabaseRequestResult.failure(
      SupabaseErrorHandler.handleError(AppStrings.noInternetConnection),
    );
  }
}
