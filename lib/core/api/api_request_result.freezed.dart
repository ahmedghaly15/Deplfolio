// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_request_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiRequestResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel errorModel) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel errorModel)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel errorModel)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiRequestSuccess<T> value) success,
    required TResult Function(ApiRequestFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiRequestSuccess<T> value)? success,
    TResult? Function(ApiRequestFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiRequestSuccess<T> value)? success,
    TResult Function(ApiRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiRequestResultCopyWith<T, $Res> {
  factory $ApiRequestResultCopyWith(
          ApiRequestResult<T> value, $Res Function(ApiRequestResult<T>) then) =
      _$ApiRequestResultCopyWithImpl<T, $Res, ApiRequestResult<T>>;
}

/// @nodoc
class _$ApiRequestResultCopyWithImpl<T, $Res, $Val extends ApiRequestResult<T>>
    implements $ApiRequestResultCopyWith<T, $Res> {
  _$ApiRequestResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiRequestResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ApiRequestSuccessImplCopyWith<T, $Res> {
  factory _$$ApiRequestSuccessImplCopyWith(_$ApiRequestSuccessImpl<T> value,
          $Res Function(_$ApiRequestSuccessImpl<T>) then) =
      __$$ApiRequestSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ApiRequestSuccessImplCopyWithImpl<T, $Res>
    extends _$ApiRequestResultCopyWithImpl<T, $Res, _$ApiRequestSuccessImpl<T>>
    implements _$$ApiRequestSuccessImplCopyWith<T, $Res> {
  __$$ApiRequestSuccessImplCopyWithImpl(_$ApiRequestSuccessImpl<T> _value,
      $Res Function(_$ApiRequestSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ApiRequestSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ApiRequestSuccessImpl<T> implements ApiRequestSuccess<T> {
  const _$ApiRequestSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ApiRequestResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiRequestSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ApiRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiRequestSuccessImplCopyWith<T, _$ApiRequestSuccessImpl<T>>
      get copyWith =>
          __$$ApiRequestSuccessImplCopyWithImpl<T, _$ApiRequestSuccessImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel errorModel) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel errorModel)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel errorModel)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiRequestSuccess<T> value) success,
    required TResult Function(ApiRequestFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiRequestSuccess<T> value)? success,
    TResult? Function(ApiRequestFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiRequestSuccess<T> value)? success,
    TResult Function(ApiRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApiRequestSuccess<T> implements ApiRequestResult<T> {
  const factory ApiRequestSuccess(final T data) = _$ApiRequestSuccessImpl<T>;

  T get data;

  /// Create a copy of ApiRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiRequestSuccessImplCopyWith<T, _$ApiRequestSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiRequestFailureImplCopyWith<T, $Res> {
  factory _$$ApiRequestFailureImplCopyWith(_$ApiRequestFailureImpl<T> value,
          $Res Function(_$ApiRequestFailureImpl<T>) then) =
      __$$ApiRequestFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel errorModel});
}

/// @nodoc
class __$$ApiRequestFailureImplCopyWithImpl<T, $Res>
    extends _$ApiRequestResultCopyWithImpl<T, $Res, _$ApiRequestFailureImpl<T>>
    implements _$$ApiRequestFailureImplCopyWith<T, $Res> {
  __$$ApiRequestFailureImplCopyWithImpl(_$ApiRequestFailureImpl<T> _value,
      $Res Function(_$ApiRequestFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorModel = null,
  }) {
    return _then(_$ApiRequestFailureImpl<T>(
      null == errorModel
          ? _value.errorModel
          : errorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$ApiRequestFailureImpl<T> implements ApiRequestFailure<T> {
  const _$ApiRequestFailureImpl(this.errorModel);

  @override
  final ApiErrorModel errorModel;

  @override
  String toString() {
    return 'ApiRequestResult<$T>.failure(errorModel: $errorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiRequestFailureImpl<T> &&
            (identical(other.errorModel, errorModel) ||
                other.errorModel == errorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorModel);

  /// Create a copy of ApiRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiRequestFailureImplCopyWith<T, _$ApiRequestFailureImpl<T>>
      get copyWith =>
          __$$ApiRequestFailureImplCopyWithImpl<T, _$ApiRequestFailureImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel errorModel) failure,
  }) {
    return failure(errorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel errorModel)? failure,
  }) {
    return failure?.call(errorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel errorModel)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiRequestSuccess<T> value) success,
    required TResult Function(ApiRequestFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiRequestSuccess<T> value)? success,
    TResult? Function(ApiRequestFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiRequestSuccess<T> value)? success,
    TResult Function(ApiRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ApiRequestFailure<T> implements ApiRequestResult<T> {
  const factory ApiRequestFailure(final ApiErrorModel errorModel) =
      _$ApiRequestFailureImpl<T>;

  ApiErrorModel get errorModel;

  /// Create a copy of ApiRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiRequestFailureImplCopyWith<T, _$ApiRequestFailureImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
