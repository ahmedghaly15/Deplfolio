// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get imgPath => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get shownInAbout => throw _privateConstructorUsedError;
  String? get downloadLink => throw _privateConstructorUsedError;
  String? get promoLink => throw _privateConstructorUsedError;
  String? get gitHubLink => throw _privateConstructorUsedError;

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String id,
      String imgPath,
      String title,
      String description,
      bool shownInAbout,
      String? downloadLink,
      String? promoLink,
      String? gitHubLink});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgPath = null,
    Object? title = null,
    Object? description = null,
    Object? shownInAbout = null,
    Object? downloadLink = freezed,
    Object? promoLink = freezed,
    Object? gitHubLink = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shownInAbout: null == shownInAbout
          ? _value.shownInAbout
          : shownInAbout // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadLink: freezed == downloadLink
          ? _value.downloadLink
          : downloadLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoLink: freezed == promoLink
          ? _value.promoLink
          : promoLink // ignore: cast_nullable_to_non_nullable
              as String?,
      gitHubLink: freezed == gitHubLink
          ? _value.gitHubLink
          : gitHubLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String imgPath,
      String title,
      String description,
      bool shownInAbout,
      String? downloadLink,
      String? promoLink,
      String? gitHubLink});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgPath = null,
    Object? title = null,
    Object? description = null,
    Object? shownInAbout = null,
    Object? downloadLink = freezed,
    Object? promoLink = freezed,
    Object? gitHubLink = freezed,
  }) {
    return _then(_$ProjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shownInAbout: null == shownInAbout
          ? _value.shownInAbout
          : shownInAbout // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadLink: freezed == downloadLink
          ? _value.downloadLink
          : downloadLink // ignore: cast_nullable_to_non_nullable
              as String?,
      promoLink: freezed == promoLink
          ? _value.promoLink
          : promoLink // ignore: cast_nullable_to_non_nullable
              as String?,
      gitHubLink: freezed == gitHubLink
          ? _value.gitHubLink
          : gitHubLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
      {required this.id,
      required this.imgPath,
      required this.title,
      required this.description,
      required this.shownInAbout,
      this.downloadLink,
      this.promoLink,
      this.gitHubLink});

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String id;
  @override
  final String imgPath;
  @override
  final String title;
  @override
  final String description;
  @override
  final bool shownInAbout;
  @override
  final String? downloadLink;
  @override
  final String? promoLink;
  @override
  final String? gitHubLink;

  @override
  String toString() {
    return 'Project(id: $id, imgPath: $imgPath, title: $title, description: $description, shownInAbout: $shownInAbout, downloadLink: $downloadLink, promoLink: $promoLink, gitHubLink: $gitHubLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shownInAbout, shownInAbout) ||
                other.shownInAbout == shownInAbout) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink) &&
            (identical(other.promoLink, promoLink) ||
                other.promoLink == promoLink) &&
            (identical(other.gitHubLink, gitHubLink) ||
                other.gitHubLink == gitHubLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imgPath, title, description,
      shownInAbout, downloadLink, promoLink, gitHubLink);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {required final String id,
      required final String imgPath,
      required final String title,
      required final String description,
      required final bool shownInAbout,
      final String? downloadLink,
      final String? promoLink,
      final String? gitHubLink}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String get id;
  @override
  String get imgPath;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get shownInAbout;
  @override
  String? get downloadLink;
  @override
  String? get promoLink;
  @override
  String? get gitHubLink;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
