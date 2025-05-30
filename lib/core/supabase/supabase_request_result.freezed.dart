// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supabase_request_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupabaseRequestResult<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupabaseRequestResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupabaseRequestResult<$T>()';
}


}

/// @nodoc
class $SupabaseRequestResultCopyWith<T,$Res>  {
$SupabaseRequestResultCopyWith(SupabaseRequestResult<T> _, $Res Function(SupabaseRequestResult<T>) __);
}


/// @nodoc


class _SupabaseRequestSuccess<T> implements SupabaseRequestResult<T> {
  const _SupabaseRequestSuccess(this.data);
  

 final  T data;

/// Create a copy of SupabaseRequestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupabaseRequestSuccessCopyWith<T, _SupabaseRequestSuccess<T>> get copyWith => __$SupabaseRequestSuccessCopyWithImpl<T, _SupabaseRequestSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupabaseRequestSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SupabaseRequestResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SupabaseRequestSuccessCopyWith<T,$Res> implements $SupabaseRequestResultCopyWith<T, $Res> {
  factory _$SupabaseRequestSuccessCopyWith(_SupabaseRequestSuccess<T> value, $Res Function(_SupabaseRequestSuccess<T>) _then) = __$SupabaseRequestSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class __$SupabaseRequestSuccessCopyWithImpl<T,$Res>
    implements _$SupabaseRequestSuccessCopyWith<T, $Res> {
  __$SupabaseRequestSuccessCopyWithImpl(this._self, this._then);

  final _SupabaseRequestSuccess<T> _self;
  final $Res Function(_SupabaseRequestSuccess<T>) _then;

/// Create a copy of SupabaseRequestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_SupabaseRequestSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _SupabaseRequestFailure<T> implements SupabaseRequestResult<T> {
  const _SupabaseRequestFailure(this.errorModel);
  

 final  SupabaseError errorModel;

/// Create a copy of SupabaseRequestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupabaseRequestFailureCopyWith<T, _SupabaseRequestFailure<T>> get copyWith => __$SupabaseRequestFailureCopyWithImpl<T, _SupabaseRequestFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupabaseRequestFailure<T>&&(identical(other.errorModel, errorModel) || other.errorModel == errorModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorModel);

@override
String toString() {
  return 'SupabaseRequestResult<$T>.failure(errorModel: $errorModel)';
}


}

/// @nodoc
abstract mixin class _$SupabaseRequestFailureCopyWith<T,$Res> implements $SupabaseRequestResultCopyWith<T, $Res> {
  factory _$SupabaseRequestFailureCopyWith(_SupabaseRequestFailure<T> value, $Res Function(_SupabaseRequestFailure<T>) _then) = __$SupabaseRequestFailureCopyWithImpl;
@useResult
$Res call({
 SupabaseError errorModel
});




}
/// @nodoc
class __$SupabaseRequestFailureCopyWithImpl<T,$Res>
    implements _$SupabaseRequestFailureCopyWith<T, $Res> {
  __$SupabaseRequestFailureCopyWithImpl(this._self, this._then);

  final _SupabaseRequestFailure<T> _self;
  final $Res Function(_SupabaseRequestFailure<T>) _then;

/// Create a copy of SupabaseRequestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorModel = null,}) {
  return _then(_SupabaseRequestFailure<T>(
null == errorModel ? _self.errorModel : errorModel // ignore: cast_nullable_to_non_nullable
as SupabaseError,
  ));
}


}

// dart format on
