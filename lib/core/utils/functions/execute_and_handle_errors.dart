import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../network/internet_checker.dart';
import '../../supabase/error_handler.dart';
import '../../supabase/supabase_request_result.dart';
import '../app_strings.dart';

Future<SupabaseRequestResult<T>> executeAndHandleErrors<T>(
  WidgetRef ref,
  Future<T> Function() function,
) async {
  final internetChecker = ref.watch(internetCheckerProvider);
  if (await internetChecker.isConnected) {
    try {
      final response = await function();
      return SupabaseRequestResult<T>.success(response);
    } catch (error) {
      debugPrint(
        '>>>>>>>>> CATCHED IN executeAndHandleErrors: $error <<<<<<<<<<',
      );
      return SupabaseRequestResult.failure(ErrorHandler.handleError(error));
    }
  } else {
    return SupabaseRequestResult.failure(
      ErrorHandler.handleError(AppStrings.noInternetConnection),
    );
  }
}
