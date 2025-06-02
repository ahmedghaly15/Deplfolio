import 'package:flutter/material.dart';

import '../../api/api_error_handler.dart';
import '../../api/api_request_result.dart';

Future<ApiRequestResult<T>> apiExecuteAndHandleErrors<T>(
  Future<T> Function() function,
) async {
  try {
    return ApiRequestResult<T>.success(await function());
  } catch (error) {
    debugPrint('********* Error in executeAndHandleErrors: $error **********');
    return ApiRequestResult.failure(ApiErrorHandler.handle(error));
  }
}
