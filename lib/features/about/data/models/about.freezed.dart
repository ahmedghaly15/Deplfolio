// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkExperienceModel _$WorkExperienceModelFromJson(Map<String, dynamic> json) {
  return _WorkExperienceModel.fromJson(json);
}

/// @nodoc
mixin _$WorkExperienceModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  ExperienceStatus get experienceStatus => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this WorkExperienceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkExperienceModelCopyWith<WorkExperienceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkExperienceModelCopyWith<$Res> {
  factory $WorkExperienceModelCopyWith(
          WorkExperienceModel value, $Res Function(WorkExperienceModel) then) =
      _$WorkExperienceModelCopyWithImpl<$Res, WorkExperienceModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String startDate,
      String endDate,
      String company,
      ExperienceStatus experienceStatus,
      String description});
}

/// @nodoc
class _$WorkExperienceModelCopyWithImpl<$Res, $Val extends WorkExperienceModel>
    implements $WorkExperienceModelCopyWith<$Res> {
  _$WorkExperienceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? company = null,
    Object? experienceStatus = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      experienceStatus: null == experienceStatus
          ? _value.experienceStatus
          : experienceStatus // ignore: cast_nullable_to_non_nullable
              as ExperienceStatus,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkExperienceModelImplCopyWith<$Res>
    implements $WorkExperienceModelCopyWith<$Res> {
  factory _$$WorkExperienceModelImplCopyWith(_$WorkExperienceModelImpl value,
          $Res Function(_$WorkExperienceModelImpl) then) =
      __$$WorkExperienceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String startDate,
      String endDate,
      String company,
      ExperienceStatus experienceStatus,
      String description});
}

/// @nodoc
class __$$WorkExperienceModelImplCopyWithImpl<$Res>
    extends _$WorkExperienceModelCopyWithImpl<$Res, _$WorkExperienceModelImpl>
    implements _$$WorkExperienceModelImplCopyWith<$Res> {
  __$$WorkExperienceModelImplCopyWithImpl(_$WorkExperienceModelImpl _value,
      $Res Function(_$WorkExperienceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? company = null,
    Object? experienceStatus = null,
    Object? description = null,
  }) {
    return _then(_$WorkExperienceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      experienceStatus: null == experienceStatus
          ? _value.experienceStatus
          : experienceStatus // ignore: cast_nullable_to_non_nullable
              as ExperienceStatus,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkExperienceModelImpl implements _WorkExperienceModel {
  const _$WorkExperienceModelImpl(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.company,
      required this.experienceStatus,
      required this.description});

  factory _$WorkExperienceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkExperienceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final String company;
  @override
  final ExperienceStatus experienceStatus;
  @override
  final String description;

  @override
  String toString() {
    return 'WorkExperienceModel(id: $id, title: $title, startDate: $startDate, endDate: $endDate, company: $company, experienceStatus: $experienceStatus, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkExperienceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.experienceStatus, experienceStatus) ||
                other.experienceStatus == experienceStatus) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, startDate, endDate,
      company, experienceStatus, description);

  /// Create a copy of WorkExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkExperienceModelImplCopyWith<_$WorkExperienceModelImpl> get copyWith =>
      __$$WorkExperienceModelImplCopyWithImpl<_$WorkExperienceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkExperienceModelImplToJson(
      this,
    );
  }
}

abstract class _WorkExperienceModel implements WorkExperienceModel {
  const factory _WorkExperienceModel(
      {required final String id,
      required final String title,
      required final String startDate,
      required final String endDate,
      required final String company,
      required final ExperienceStatus experienceStatus,
      required final String description}) = _$WorkExperienceModelImpl;

  factory _WorkExperienceModel.fromJson(Map<String, dynamic> json) =
      _$WorkExperienceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String get company;
  @override
  ExperienceStatus get experienceStatus;
  @override
  String get description;

  /// Create a copy of WorkExperienceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkExperienceModelImplCopyWith<_$WorkExperienceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
