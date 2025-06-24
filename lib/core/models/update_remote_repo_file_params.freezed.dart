// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_remote_repo_file_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateRemoteRepoFileParams {

 List<String> get pickedFileAllowedExtensions; String get remoteFilePath; FilePickerResult? get pickedFile; String? get commitMessage; String? get sha;
/// Create a copy of UpdateRemoteRepoFileParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateRemoteRepoFileParamsCopyWith<UpdateRemoteRepoFileParams> get copyWith => _$UpdateRemoteRepoFileParamsCopyWithImpl<UpdateRemoteRepoFileParams>(this as UpdateRemoteRepoFileParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateRemoteRepoFileParams&&const DeepCollectionEquality().equals(other.pickedFileAllowedExtensions, pickedFileAllowedExtensions)&&(identical(other.remoteFilePath, remoteFilePath) || other.remoteFilePath == remoteFilePath)&&(identical(other.pickedFile, pickedFile) || other.pickedFile == pickedFile)&&(identical(other.commitMessage, commitMessage) || other.commitMessage == commitMessage)&&(identical(other.sha, sha) || other.sha == sha));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pickedFileAllowedExtensions),remoteFilePath,pickedFile,commitMessage,sha);

@override
String toString() {
  return 'UpdateRemoteRepoFileParams(pickedFileAllowedExtensions: $pickedFileAllowedExtensions, remoteFilePath: $remoteFilePath, pickedFile: $pickedFile, commitMessage: $commitMessage, sha: $sha)';
}


}

/// @nodoc
abstract mixin class $UpdateRemoteRepoFileParamsCopyWith<$Res>  {
  factory $UpdateRemoteRepoFileParamsCopyWith(UpdateRemoteRepoFileParams value, $Res Function(UpdateRemoteRepoFileParams) _then) = _$UpdateRemoteRepoFileParamsCopyWithImpl;
@useResult
$Res call({
 List<String> pickedFileAllowedExtensions, String remoteFilePath, FilePickerResult? pickedFile, String? commitMessage, String? sha
});




}
/// @nodoc
class _$UpdateRemoteRepoFileParamsCopyWithImpl<$Res>
    implements $UpdateRemoteRepoFileParamsCopyWith<$Res> {
  _$UpdateRemoteRepoFileParamsCopyWithImpl(this._self, this._then);

  final UpdateRemoteRepoFileParams _self;
  final $Res Function(UpdateRemoteRepoFileParams) _then;

/// Create a copy of UpdateRemoteRepoFileParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pickedFileAllowedExtensions = null,Object? remoteFilePath = null,Object? pickedFile = freezed,Object? commitMessage = freezed,Object? sha = freezed,}) {
  return _then(_self.copyWith(
pickedFileAllowedExtensions: null == pickedFileAllowedExtensions ? _self.pickedFileAllowedExtensions : pickedFileAllowedExtensions // ignore: cast_nullable_to_non_nullable
as List<String>,remoteFilePath: null == remoteFilePath ? _self.remoteFilePath : remoteFilePath // ignore: cast_nullable_to_non_nullable
as String,pickedFile: freezed == pickedFile ? _self.pickedFile : pickedFile // ignore: cast_nullable_to_non_nullable
as FilePickerResult?,commitMessage: freezed == commitMessage ? _self.commitMessage : commitMessage // ignore: cast_nullable_to_non_nullable
as String?,sha: freezed == sha ? _self.sha : sha // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _UpdateRemoteRepoFileParams implements UpdateRemoteRepoFileParams {
  const _UpdateRemoteRepoFileParams({required final  List<String> pickedFileAllowedExtensions, required this.remoteFilePath, this.pickedFile, this.commitMessage, this.sha}): _pickedFileAllowedExtensions = pickedFileAllowedExtensions;
  

 final  List<String> _pickedFileAllowedExtensions;
@override List<String> get pickedFileAllowedExtensions {
  if (_pickedFileAllowedExtensions is EqualUnmodifiableListView) return _pickedFileAllowedExtensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pickedFileAllowedExtensions);
}

@override final  String remoteFilePath;
@override final  FilePickerResult? pickedFile;
@override final  String? commitMessage;
@override final  String? sha;

/// Create a copy of UpdateRemoteRepoFileParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateRemoteRepoFileParamsCopyWith<_UpdateRemoteRepoFileParams> get copyWith => __$UpdateRemoteRepoFileParamsCopyWithImpl<_UpdateRemoteRepoFileParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateRemoteRepoFileParams&&const DeepCollectionEquality().equals(other._pickedFileAllowedExtensions, _pickedFileAllowedExtensions)&&(identical(other.remoteFilePath, remoteFilePath) || other.remoteFilePath == remoteFilePath)&&(identical(other.pickedFile, pickedFile) || other.pickedFile == pickedFile)&&(identical(other.commitMessage, commitMessage) || other.commitMessage == commitMessage)&&(identical(other.sha, sha) || other.sha == sha));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pickedFileAllowedExtensions),remoteFilePath,pickedFile,commitMessage,sha);

@override
String toString() {
  return 'UpdateRemoteRepoFileParams(pickedFileAllowedExtensions: $pickedFileAllowedExtensions, remoteFilePath: $remoteFilePath, pickedFile: $pickedFile, commitMessage: $commitMessage, sha: $sha)';
}


}

/// @nodoc
abstract mixin class _$UpdateRemoteRepoFileParamsCopyWith<$Res> implements $UpdateRemoteRepoFileParamsCopyWith<$Res> {
  factory _$UpdateRemoteRepoFileParamsCopyWith(_UpdateRemoteRepoFileParams value, $Res Function(_UpdateRemoteRepoFileParams) _then) = __$UpdateRemoteRepoFileParamsCopyWithImpl;
@override @useResult
$Res call({
 List<String> pickedFileAllowedExtensions, String remoteFilePath, FilePickerResult? pickedFile, String? commitMessage, String? sha
});




}
/// @nodoc
class __$UpdateRemoteRepoFileParamsCopyWithImpl<$Res>
    implements _$UpdateRemoteRepoFileParamsCopyWith<$Res> {
  __$UpdateRemoteRepoFileParamsCopyWithImpl(this._self, this._then);

  final _UpdateRemoteRepoFileParams _self;
  final $Res Function(_UpdateRemoteRepoFileParams) _then;

/// Create a copy of UpdateRemoteRepoFileParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pickedFileAllowedExtensions = null,Object? remoteFilePath = null,Object? pickedFile = freezed,Object? commitMessage = freezed,Object? sha = freezed,}) {
  return _then(_UpdateRemoteRepoFileParams(
pickedFileAllowedExtensions: null == pickedFileAllowedExtensions ? _self._pickedFileAllowedExtensions : pickedFileAllowedExtensions // ignore: cast_nullable_to_non_nullable
as List<String>,remoteFilePath: null == remoteFilePath ? _self.remoteFilePath : remoteFilePath // ignore: cast_nullable_to_non_nullable
as String,pickedFile: freezed == pickedFile ? _self.pickedFile : pickedFile // ignore: cast_nullable_to_non_nullable
as FilePickerResult?,commitMessage: freezed == commitMessage ? _self.commitMessage : commitMessage // ignore: cast_nullable_to_non_nullable
as String?,sha: freezed == sha ? _self.sha : sha // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
