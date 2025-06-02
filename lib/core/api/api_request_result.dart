import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_error_model.dart';

part 'api_request_result.freezed.dart';

@freezed
sealed class ApiRequestResult<T> with _$ApiRequestResult<T> {
  const factory ApiRequestResult.success(T data) = ApiRequestSuccess<T>;
  const factory ApiRequestResult.failure(ApiErrorModel errorModel) =
      ApiRequestFailure<T>;
}
