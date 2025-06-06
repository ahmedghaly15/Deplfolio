// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Project {

 String get id; String get imgPath; String get title; String get description; bool get shownInAbout; String? get downloadLink; String? get promoLink; String? get gitHubLink;
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCopyWith<Project> get copyWith => _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Project&&(identical(other.id, id) || other.id == id)&&(identical(other.imgPath, imgPath) || other.imgPath == imgPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.shownInAbout, shownInAbout) || other.shownInAbout == shownInAbout)&&(identical(other.downloadLink, downloadLink) || other.downloadLink == downloadLink)&&(identical(other.promoLink, promoLink) || other.promoLink == promoLink)&&(identical(other.gitHubLink, gitHubLink) || other.gitHubLink == gitHubLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imgPath,title,description,shownInAbout,downloadLink,promoLink,gitHubLink);

@override
String toString() {
  return 'Project(id: $id, imgPath: $imgPath, title: $title, description: $description, shownInAbout: $shownInAbout, downloadLink: $downloadLink, promoLink: $promoLink, gitHubLink: $gitHubLink)';
}


}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res>  {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) = _$ProjectCopyWithImpl;
@useResult
$Res call({
 String id, String imgPath, String title, String description, bool shownInAbout, String? downloadLink, String? promoLink, String? gitHubLink
});




}
/// @nodoc
class _$ProjectCopyWithImpl<$Res>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imgPath = null,Object? title = null,Object? description = null,Object? shownInAbout = null,Object? downloadLink = freezed,Object? promoLink = freezed,Object? gitHubLink = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imgPath: null == imgPath ? _self.imgPath : imgPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,shownInAbout: null == shownInAbout ? _self.shownInAbout : shownInAbout // ignore: cast_nullable_to_non_nullable
as bool,downloadLink: freezed == downloadLink ? _self.downloadLink : downloadLink // ignore: cast_nullable_to_non_nullable
as String?,promoLink: freezed == promoLink ? _self.promoLink : promoLink // ignore: cast_nullable_to_non_nullable
as String?,gitHubLink: freezed == gitHubLink ? _self.gitHubLink : gitHubLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable()
class _Project implements Project {
  const _Project({required this.id, required this.imgPath, required this.title, required this.description, required this.shownInAbout, this.downloadLink, this.promoLink, this.gitHubLink});
  factory _Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

@override final  String id;
@override final  String imgPath;
@override final  String title;
@override final  String description;
@override final  bool shownInAbout;
@override final  String? downloadLink;
@override final  String? promoLink;
@override final  String? gitHubLink;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectCopyWith<_Project> get copyWith => __$ProjectCopyWithImpl<_Project>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Project&&(identical(other.id, id) || other.id == id)&&(identical(other.imgPath, imgPath) || other.imgPath == imgPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.shownInAbout, shownInAbout) || other.shownInAbout == shownInAbout)&&(identical(other.downloadLink, downloadLink) || other.downloadLink == downloadLink)&&(identical(other.promoLink, promoLink) || other.promoLink == promoLink)&&(identical(other.gitHubLink, gitHubLink) || other.gitHubLink == gitHubLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imgPath,title,description,shownInAbout,downloadLink,promoLink,gitHubLink);

@override
String toString() {
  return 'Project(id: $id, imgPath: $imgPath, title: $title, description: $description, shownInAbout: $shownInAbout, downloadLink: $downloadLink, promoLink: $promoLink, gitHubLink: $gitHubLink)';
}


}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) = __$ProjectCopyWithImpl;
@override @useResult
$Res call({
 String id, String imgPath, String title, String description, bool shownInAbout, String? downloadLink, String? promoLink, String? gitHubLink
});




}
/// @nodoc
class __$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imgPath = null,Object? title = null,Object? description = null,Object? shownInAbout = null,Object? downloadLink = freezed,Object? promoLink = freezed,Object? gitHubLink = freezed,}) {
  return _then(_Project(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imgPath: null == imgPath ? _self.imgPath : imgPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,shownInAbout: null == shownInAbout ? _self.shownInAbout : shownInAbout // ignore: cast_nullable_to_non_nullable
as bool,downloadLink: freezed == downloadLink ? _self.downloadLink : downloadLink // ignore: cast_nullable_to_non_nullable
as String?,promoLink: freezed == promoLink ? _self.promoLink : promoLink // ignore: cast_nullable_to_non_nullable
as String?,gitHubLink: freezed == gitHubLink ? _self.gitHubLink : gitHubLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
