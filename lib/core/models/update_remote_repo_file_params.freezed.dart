// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_remote_repo_file_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateRemoteRepoFileParams {
  String get remoteFilePath => throw _privateConstructorUsedError;
  FilePickerResult? get pickedFile => throw _privateConstructorUsedError;
  String? get commitMessage => throw _privateConstructorUsedError;
  String? get sha => throw _privateConstructorUsedError;

  /// Create a copy of UpdateRemoteRepoFileParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateRemoteRepoFileParamsCopyWith<UpdateRemoteRepoFileParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRemoteRepoFileParamsCopyWith<$Res> {
  factory $UpdateRemoteRepoFileParamsCopyWith(UpdateRemoteRepoFileParams value,
          $Res Function(UpdateRemoteRepoFileParams) then) =
      _$UpdateRemoteRepoFileParamsCopyWithImpl<$Res,
          UpdateRemoteRepoFileParams>;
  @useResult
  $Res call(
      {String remoteFilePath,
      FilePickerResult? pickedFile,
      String? commitMessage,
      String? sha});
}

/// @nodoc
class _$UpdateRemoteRepoFileParamsCopyWithImpl<$Res,
        $Val extends UpdateRemoteRepoFileParams>
    implements $UpdateRemoteRepoFileParamsCopyWith<$Res> {
  _$UpdateRemoteRepoFileParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateRemoteRepoFileParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteFilePath = null,
    Object? pickedFile = freezed,
    Object? commitMessage = freezed,
    Object? sha = freezed,
  }) {
    return _then(_value.copyWith(
      remoteFilePath: null == remoteFilePath
          ? _value.remoteFilePath
          : remoteFilePath // ignore: cast_nullable_to_non_nullable
              as String,
      pickedFile: freezed == pickedFile
          ? _value.pickedFile
          : pickedFile // ignore: cast_nullable_to_non_nullable
              as FilePickerResult?,
      commitMessage: freezed == commitMessage
          ? _value.commitMessage
          : commitMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      sha: freezed == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateRemoteRepoFileParamsImplCopyWith<$Res>
    implements $UpdateRemoteRepoFileParamsCopyWith<$Res> {
  factory _$$UpdateRemoteRepoFileParamsImplCopyWith(
          _$UpdateRemoteRepoFileParamsImpl value,
          $Res Function(_$UpdateRemoteRepoFileParamsImpl) then) =
      __$$UpdateRemoteRepoFileParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String remoteFilePath,
      FilePickerResult? pickedFile,
      String? commitMessage,
      String? sha});
}

/// @nodoc
class __$$UpdateRemoteRepoFileParamsImplCopyWithImpl<$Res>
    extends _$UpdateRemoteRepoFileParamsCopyWithImpl<$Res,
        _$UpdateRemoteRepoFileParamsImpl>
    implements _$$UpdateRemoteRepoFileParamsImplCopyWith<$Res> {
  __$$UpdateRemoteRepoFileParamsImplCopyWithImpl(
      _$UpdateRemoteRepoFileParamsImpl _value,
      $Res Function(_$UpdateRemoteRepoFileParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateRemoteRepoFileParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteFilePath = null,
    Object? pickedFile = freezed,
    Object? commitMessage = freezed,
    Object? sha = freezed,
  }) {
    return _then(_$UpdateRemoteRepoFileParamsImpl(
      remoteFilePath: null == remoteFilePath
          ? _value.remoteFilePath
          : remoteFilePath // ignore: cast_nullable_to_non_nullable
              as String,
      pickedFile: freezed == pickedFile
          ? _value.pickedFile
          : pickedFile // ignore: cast_nullable_to_non_nullable
              as FilePickerResult?,
      commitMessage: freezed == commitMessage
          ? _value.commitMessage
          : commitMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      sha: freezed == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateRemoteRepoFileParamsImpl implements _UpdateRemoteRepoFileParams {
  const _$UpdateRemoteRepoFileParamsImpl(
      {required this.remoteFilePath,
      this.pickedFile,
      this.commitMessage,
      this.sha});

  @override
  final String remoteFilePath;
  @override
  final FilePickerResult? pickedFile;
  @override
  final String? commitMessage;
  @override
  final String? sha;

  @override
  String toString() {
    return 'UpdateRemoteRepoFileParams(remoteFilePath: $remoteFilePath, pickedFile: $pickedFile, commitMessage: $commitMessage, sha: $sha)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRemoteRepoFileParamsImpl &&
            (identical(other.remoteFilePath, remoteFilePath) ||
                other.remoteFilePath == remoteFilePath) &&
            (identical(other.pickedFile, pickedFile) ||
                other.pickedFile == pickedFile) &&
            (identical(other.commitMessage, commitMessage) ||
                other.commitMessage == commitMessage) &&
            (identical(other.sha, sha) || other.sha == sha));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remoteFilePath, pickedFile, commitMessage, sha);

  /// Create a copy of UpdateRemoteRepoFileParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRemoteRepoFileParamsImplCopyWith<_$UpdateRemoteRepoFileParamsImpl>
      get copyWith => __$$UpdateRemoteRepoFileParamsImplCopyWithImpl<
          _$UpdateRemoteRepoFileParamsImpl>(this, _$identity);
}

abstract class _UpdateRemoteRepoFileParams
    implements UpdateRemoteRepoFileParams {
  const factory _UpdateRemoteRepoFileParams(
      {required final String remoteFilePath,
      final FilePickerResult? pickedFile,
      final String? commitMessage,
      final String? sha}) = _$UpdateRemoteRepoFileParamsImpl;

  @override
  String get remoteFilePath;
  @override
  FilePickerResult? get pickedFile;
  @override
  String? get commitMessage;
  @override
  String? get sha;

  /// Create a copy of UpdateRemoteRepoFileParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRemoteRepoFileParamsImplCopyWith<_$UpdateRemoteRepoFileParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
