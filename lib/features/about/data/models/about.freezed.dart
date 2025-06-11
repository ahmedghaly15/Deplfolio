// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkExperienceModel {

 String get id; String get title; String get startDate; String get endDate; String get company; ExperienceStatus get experienceStatus; String get description;
/// Create a copy of WorkExperienceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkExperienceModelCopyWith<WorkExperienceModel> get copyWith => _$WorkExperienceModelCopyWithImpl<WorkExperienceModel>(this as WorkExperienceModel, _$identity);

  /// Serializes this WorkExperienceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.company, company) || other.company == company)&&(identical(other.experienceStatus, experienceStatus) || other.experienceStatus == experienceStatus)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,startDate,endDate,company,experienceStatus,description);

@override
String toString() {
  return 'WorkExperienceModel(id: $id, title: $title, startDate: $startDate, endDate: $endDate, company: $company, experienceStatus: $experienceStatus, description: $description)';
}


}

/// @nodoc
abstract mixin class $WorkExperienceModelCopyWith<$Res>  {
  factory $WorkExperienceModelCopyWith(WorkExperienceModel value, $Res Function(WorkExperienceModel) _then) = _$WorkExperienceModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String startDate, String endDate, String company, ExperienceStatus experienceStatus, String description
});




}
/// @nodoc
class _$WorkExperienceModelCopyWithImpl<$Res>
    implements $WorkExperienceModelCopyWith<$Res> {
  _$WorkExperienceModelCopyWithImpl(this._self, this._then);

  final WorkExperienceModel _self;
  final $Res Function(WorkExperienceModel) _then;

/// Create a copy of WorkExperienceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? startDate = null,Object? endDate = null,Object? company = null,Object? experienceStatus = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,experienceStatus: null == experienceStatus ? _self.experienceStatus : experienceStatus // ignore: cast_nullable_to_non_nullable
as ExperienceStatus,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WorkExperienceModel implements WorkExperienceModel {
  const _WorkExperienceModel({required this.id, required this.title, required this.startDate, required this.endDate, required this.company, required this.experienceStatus, required this.description});
  factory _WorkExperienceModel.fromJson(Map<String, dynamic> json) => _$WorkExperienceModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String startDate;
@override final  String endDate;
@override final  String company;
@override final  ExperienceStatus experienceStatus;
@override final  String description;

/// Create a copy of WorkExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkExperienceModelCopyWith<_WorkExperienceModel> get copyWith => __$WorkExperienceModelCopyWithImpl<_WorkExperienceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkExperienceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.company, company) || other.company == company)&&(identical(other.experienceStatus, experienceStatus) || other.experienceStatus == experienceStatus)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,startDate,endDate,company,experienceStatus,description);

@override
String toString() {
  return 'WorkExperienceModel(id: $id, title: $title, startDate: $startDate, endDate: $endDate, company: $company, experienceStatus: $experienceStatus, description: $description)';
}


}

/// @nodoc
abstract mixin class _$WorkExperienceModelCopyWith<$Res> implements $WorkExperienceModelCopyWith<$Res> {
  factory _$WorkExperienceModelCopyWith(_WorkExperienceModel value, $Res Function(_WorkExperienceModel) _then) = __$WorkExperienceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String startDate, String endDate, String company, ExperienceStatus experienceStatus, String description
});




}
/// @nodoc
class __$WorkExperienceModelCopyWithImpl<$Res>
    implements _$WorkExperienceModelCopyWith<$Res> {
  __$WorkExperienceModelCopyWithImpl(this._self, this._then);

  final _WorkExperienceModel _self;
  final $Res Function(_WorkExperienceModel) _then;

/// Create a copy of WorkExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? startDate = null,Object? endDate = null,Object? company = null,Object? experienceStatus = null,Object? description = null,}) {
  return _then(_WorkExperienceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,experienceStatus: null == experienceStatus ? _self.experienceStatus : experienceStatus // ignore: cast_nullable_to_non_nullable
as ExperienceStatus,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
