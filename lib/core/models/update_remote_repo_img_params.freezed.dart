// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_remote_repo_img_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateRemoteRepoImgParams {
  String get projectTitle => throw _privateConstructorUsedError;
  XFile? get pickedFile => throw _privateConstructorUsedError;
  String? get sha => throw _privateConstructorUsedError;

  /// Create a copy of UpdateRemoteRepoImgParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateRemoteRepoImgParamsCopyWith<UpdateRemoteRepoImgParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRemoteRepoImgParamsCopyWith<$Res> {
  factory $UpdateRemoteRepoImgParamsCopyWith(UpdateRemoteRepoImgParams value,
          $Res Function(UpdateRemoteRepoImgParams) then) =
      _$UpdateRemoteRepoImgParamsCopyWithImpl<$Res, UpdateRemoteRepoImgParams>;
  @useResult
  $Res call({String projectTitle, XFile? pickedFile, String? sha});
}

/// @nodoc
class _$UpdateRemoteRepoImgParamsCopyWithImpl<$Res,
        $Val extends UpdateRemoteRepoImgParams>
    implements $UpdateRemoteRepoImgParamsCopyWith<$Res> {
  _$UpdateRemoteRepoImgParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateRemoteRepoImgParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTitle = null,
    Object? pickedFile = freezed,
    Object? sha = freezed,
  }) {
    return _then(_value.copyWith(
      projectTitle: null == projectTitle
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pickedFile: freezed == pickedFile
          ? _value.pickedFile
          : pickedFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      sha: freezed == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateRemoteRepoImgParamsImplCopyWith<$Res>
    implements $UpdateRemoteRepoImgParamsCopyWith<$Res> {
  factory _$$UpdateRemoteRepoImgParamsImplCopyWith(
          _$UpdateRemoteRepoImgParamsImpl value,
          $Res Function(_$UpdateRemoteRepoImgParamsImpl) then) =
      __$$UpdateRemoteRepoImgParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectTitle, XFile? pickedFile, String? sha});
}

/// @nodoc
class __$$UpdateRemoteRepoImgParamsImplCopyWithImpl<$Res>
    extends _$UpdateRemoteRepoImgParamsCopyWithImpl<$Res,
        _$UpdateRemoteRepoImgParamsImpl>
    implements _$$UpdateRemoteRepoImgParamsImplCopyWith<$Res> {
  __$$UpdateRemoteRepoImgParamsImplCopyWithImpl(
      _$UpdateRemoteRepoImgParamsImpl _value,
      $Res Function(_$UpdateRemoteRepoImgParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateRemoteRepoImgParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTitle = null,
    Object? pickedFile = freezed,
    Object? sha = freezed,
  }) {
    return _then(_$UpdateRemoteRepoImgParamsImpl(
      projectTitle: null == projectTitle
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pickedFile: freezed == pickedFile
          ? _value.pickedFile
          : pickedFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      sha: freezed == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateRemoteRepoImgParamsImpl implements _UpdateRemoteRepoImgParams {
  const _$UpdateRemoteRepoImgParamsImpl(
      {required this.projectTitle, this.pickedFile, this.sha});

  @override
  final String projectTitle;
  @override
  final XFile? pickedFile;
  @override
  final String? sha;

  @override
  String toString() {
    return 'UpdateRemoteRepoImgParams(projectTitle: $projectTitle, pickedFile: $pickedFile, sha: $sha)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRemoteRepoImgParamsImpl &&
            (identical(other.projectTitle, projectTitle) ||
                other.projectTitle == projectTitle) &&
            (identical(other.pickedFile, pickedFile) ||
                other.pickedFile == pickedFile) &&
            (identical(other.sha, sha) || other.sha == sha));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectTitle, pickedFile, sha);

  /// Create a copy of UpdateRemoteRepoImgParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRemoteRepoImgParamsImplCopyWith<_$UpdateRemoteRepoImgParamsImpl>
      get copyWith => __$$UpdateRemoteRepoImgParamsImplCopyWithImpl<
          _$UpdateRemoteRepoImgParamsImpl>(this, _$identity);
}

abstract class _UpdateRemoteRepoImgParams implements UpdateRemoteRepoImgParams {
  const factory _UpdateRemoteRepoImgParams(
      {required final String projectTitle,
      final XFile? pickedFile,
      final String? sha}) = _$UpdateRemoteRepoImgParamsImpl;

  @override
  String get projectTitle;
  @override
  XFile? get pickedFile;
  @override
  String? get sha;

  /// Create a copy of UpdateRemoteRepoImgParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRemoteRepoImgParamsImplCopyWith<_$UpdateRemoteRepoImgParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
