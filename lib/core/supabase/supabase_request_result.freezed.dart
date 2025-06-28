// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supabase_request_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SupabaseRequestResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(SupabaseError errorModel) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(SupabaseError errorModel)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(SupabaseError errorModel)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SupabaseRequestSuccess<T> value) success,
    required TResult Function(SupabaseRequestFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SupabaseRequestSuccess<T> value)? success,
    TResult? Function(SupabaseRequestFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SupabaseRequestSuccess<T> value)? success,
    TResult Function(SupabaseRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupabaseRequestResultCopyWith<T, $Res> {
  factory $SupabaseRequestResultCopyWith(SupabaseRequestResult<T> value,
          $Res Function(SupabaseRequestResult<T>) then) =
      _$SupabaseRequestResultCopyWithImpl<T, $Res, SupabaseRequestResult<T>>;
}

/// @nodoc
class _$SupabaseRequestResultCopyWithImpl<T, $Res,
        $Val extends SupabaseRequestResult<T>>
    implements $SupabaseRequestResultCopyWith<T, $Res> {
  _$SupabaseRequestResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupabaseRequestResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SupabaseRequestSuccessImplCopyWith<T, $Res> {
  factory _$$SupabaseRequestSuccessImplCopyWith(
          _$SupabaseRequestSuccessImpl<T> value,
          $Res Function(_$SupabaseRequestSuccessImpl<T>) then) =
      __$$SupabaseRequestSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SupabaseRequestSuccessImplCopyWithImpl<T, $Res>
    extends _$SupabaseRequestResultCopyWithImpl<T, $Res,
        _$SupabaseRequestSuccessImpl<T>>
    implements _$$SupabaseRequestSuccessImplCopyWith<T, $Res> {
  __$$SupabaseRequestSuccessImplCopyWithImpl(
      _$SupabaseRequestSuccessImpl<T> _value,
      $Res Function(_$SupabaseRequestSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of SupabaseRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SupabaseRequestSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SupabaseRequestSuccessImpl<T> implements SupabaseRequestSuccess<T> {
  const _$SupabaseRequestSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'SupabaseRequestResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupabaseRequestSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of SupabaseRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupabaseRequestSuccessImplCopyWith<T, _$SupabaseRequestSuccessImpl<T>>
      get copyWith => __$$SupabaseRequestSuccessImplCopyWithImpl<T,
          _$SupabaseRequestSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(SupabaseError errorModel) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(SupabaseError errorModel)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(SupabaseError errorModel)? failure,
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
    required TResult Function(SupabaseRequestSuccess<T> value) success,
    required TResult Function(SupabaseRequestFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SupabaseRequestSuccess<T> value)? success,
    TResult? Function(SupabaseRequestFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SupabaseRequestSuccess<T> value)? success,
    TResult Function(SupabaseRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SupabaseRequestSuccess<T> implements SupabaseRequestResult<T> {
  const factory SupabaseRequestSuccess(final T data) =
      _$SupabaseRequestSuccessImpl<T>;

  T get data;

  /// Create a copy of SupabaseRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupabaseRequestSuccessImplCopyWith<T, _$SupabaseRequestSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SupabaseRequestFailureImplCopyWith<T, $Res> {
  factory _$$SupabaseRequestFailureImplCopyWith(
          _$SupabaseRequestFailureImpl<T> value,
          $Res Function(_$SupabaseRequestFailureImpl<T>) then) =
      __$$SupabaseRequestFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({SupabaseError errorModel});
}

/// @nodoc
class __$$SupabaseRequestFailureImplCopyWithImpl<T, $Res>
    extends _$SupabaseRequestResultCopyWithImpl<T, $Res,
        _$SupabaseRequestFailureImpl<T>>
    implements _$$SupabaseRequestFailureImplCopyWith<T, $Res> {
  __$$SupabaseRequestFailureImplCopyWithImpl(
      _$SupabaseRequestFailureImpl<T> _value,
      $Res Function(_$SupabaseRequestFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of SupabaseRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorModel = null,
  }) {
    return _then(_$SupabaseRequestFailureImpl<T>(
      null == errorModel
          ? _value.errorModel
          : errorModel // ignore: cast_nullable_to_non_nullable
              as SupabaseError,
    ));
  }
}

/// @nodoc

class _$SupabaseRequestFailureImpl<T> implements SupabaseRequestFailure<T> {
  const _$SupabaseRequestFailureImpl(this.errorModel);

  @override
  final SupabaseError errorModel;

  @override
  String toString() {
    return 'SupabaseRequestResult<$T>.failure(errorModel: $errorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupabaseRequestFailureImpl<T> &&
            (identical(other.errorModel, errorModel) ||
                other.errorModel == errorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorModel);

  /// Create a copy of SupabaseRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupabaseRequestFailureImplCopyWith<T, _$SupabaseRequestFailureImpl<T>>
      get copyWith => __$$SupabaseRequestFailureImplCopyWithImpl<T,
          _$SupabaseRequestFailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(SupabaseError errorModel) failure,
  }) {
    return failure(errorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(SupabaseError errorModel)? failure,
  }) {
    return failure?.call(errorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(SupabaseError errorModel)? failure,
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
    required TResult Function(SupabaseRequestSuccess<T> value) success,
    required TResult Function(SupabaseRequestFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SupabaseRequestSuccess<T> value)? success,
    TResult? Function(SupabaseRequestFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SupabaseRequestSuccess<T> value)? success,
    TResult Function(SupabaseRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SupabaseRequestFailure<T> implements SupabaseRequestResult<T> {
  const factory SupabaseRequestFailure(final SupabaseError errorModel) =
      _$SupabaseRequestFailureImpl<T>;

  SupabaseError get errorModel;

  /// Create a copy of SupabaseRequestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupabaseRequestFailureImplCopyWith<T, _$SupabaseRequestFailureImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
