// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_request_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiRequestResult<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiRequestResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiRequestResult<$T>()';
}


}

/// @nodoc
class $ApiRequestResultCopyWith<T,$Res>  {
$ApiRequestResultCopyWith(ApiRequestResult<T> _, $Res Function(ApiRequestResult<T>) __);
}


/// @nodoc


class ApiRequestSuccess<T> implements ApiRequestResult<T> {
  const ApiRequestSuccess(this.data);
  

 final  T data;

/// Create a copy of ApiRequestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiRequestSuccessCopyWith<T, ApiRequestSuccess<T>> get copyWith => _$ApiRequestSuccessCopyWithImpl<T, ApiRequestSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiRequestSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiRequestResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ApiRequestSuccessCopyWith<T,$Res> implements $ApiRequestResultCopyWith<T, $Res> {
  factory $ApiRequestSuccessCopyWith(ApiRequestSuccess<T> value, $Res Function(ApiRequestSuccess<T>) _then) = _$ApiRequestSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$ApiRequestSuccessCopyWithImpl<T,$Res>
    implements $ApiRequestSuccessCopyWith<T, $Res> {
  _$ApiRequestSuccessCopyWithImpl(this._self, this._then);

  final ApiRequestSuccess<T> _self;
  final $Res Function(ApiRequestSuccess<T>) _then;

/// Create a copy of ApiRequestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ApiRequestSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ApiRequestFailure<T> implements ApiRequestResult<T> {
  const ApiRequestFailure(this.errorModel);
  

 final  ApiErrorModel errorModel;

/// Create a copy of ApiRequestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiRequestFailureCopyWith<T, ApiRequestFailure<T>> get copyWith => _$ApiRequestFailureCopyWithImpl<T, ApiRequestFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiRequestFailure<T>&&(identical(other.errorModel, errorModel) || other.errorModel == errorModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorModel);

@override
String toString() {
  return 'ApiRequestResult<$T>.failure(errorModel: $errorModel)';
}


}

/// @nodoc
abstract mixin class $ApiRequestFailureCopyWith<T,$Res> implements $ApiRequestResultCopyWith<T, $Res> {
  factory $ApiRequestFailureCopyWith(ApiRequestFailure<T> value, $Res Function(ApiRequestFailure<T>) _then) = _$ApiRequestFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel errorModel
});




}
/// @nodoc
class _$ApiRequestFailureCopyWithImpl<T,$Res>
    implements $ApiRequestFailureCopyWith<T, $Res> {
  _$ApiRequestFailureCopyWithImpl(this._self, this._then);

  final ApiRequestFailure<T> _self;
  final $Res Function(ApiRequestFailure<T>) _then;

/// Create a copy of ApiRequestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorModel = null,}) {
  return _then(ApiRequestFailure<T>(
null == errorModel ? _self.errorModel : errorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
