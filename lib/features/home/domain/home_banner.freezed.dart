// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeBanner {

 String get id; String get tag; String get title; String get color;
/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeBannerCopyWith<HomeBanner> get copyWith => _$HomeBannerCopyWithImpl<HomeBanner>(this as HomeBanner, _$identity);

  /// Serializes this HomeBanner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeBanner;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBanner&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.color, _this.color) || other.color == _this.color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeBanner;
  return Object.hash(runtimeType,_this.id,_this.tag,_this.title,_this.color);
}

@override
String toString() {
  final _this = this as HomeBanner;
  return 'HomeBanner(id: ${_this.id}, tag: ${_this.tag}, title: ${_this.title}, color: ${_this.color})';
}


}

/// @nodoc
abstract mixin class $HomeBannerCopyWith<$Res>  {
  factory $HomeBannerCopyWith(HomeBanner value, $Res Function(HomeBanner) _then) = _$HomeBannerCopyWithImpl;
@useResult
$Res call({
 String id, String tag, String title, String color
});




}
/// @nodoc
class _$HomeBannerCopyWithImpl<$Res>
    implements $HomeBannerCopyWith<$Res> {
  _$HomeBannerCopyWithImpl(this._self, this._then);

  final HomeBanner _self;
  final $Res Function(HomeBanner) _then;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tag = null,Object? title = null,Object? color = null,}) {
  return _then(HomeBanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeBanner].
extension HomeBannerPatterns on HomeBanner {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeBanner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeBanner value)  $default,){
final _that = this;
switch (_that) {
case _HomeBanner():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeBanner value)?  $default,){
final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tag,  String title,  String color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
return $default(_that.id,_that.tag,_that.title,_that.color);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tag,  String title,  String color)  $default,) {final _that = this;
switch (_that) {
case _HomeBanner():
return $default(_that.id,_that.tag,_that.title,_that.color);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tag,  String title,  String color)?  $default,) {final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
return $default(_that.id,_that.tag,_that.title,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeBanner implements HomeBanner {
  const _HomeBanner({required this.id, required this.tag, required this.title, required this.color});
  factory _HomeBanner.fromJson(Map<String, dynamic> json) => _$HomeBannerFromJson(json);

@override final  String id;
@override final  String tag;
@override final  String title;
@override final  String color;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeBannerCopyWith<_HomeBanner> get copyWith => __$HomeBannerCopyWithImpl<_HomeBanner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeBannerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeBanner&&(identical(other.id, id) || other.id == id)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.title, title) || other.title == title)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tag,title,color);
}

@override
String toString() {
    return 'HomeBanner(id: $id, tag: $tag, title: $title, color: $color)';
}


}

/// @nodoc
abstract mixin class _$HomeBannerCopyWith<$Res> implements $HomeBannerCopyWith<$Res> {
  factory _$HomeBannerCopyWith(_HomeBanner value, $Res Function(_HomeBanner) _then) = __$HomeBannerCopyWithImpl;
@override @useResult
$Res call({
 String id, String tag, String title, String color
});




}
/// @nodoc
class __$HomeBannerCopyWithImpl<$Res>
    implements _$HomeBannerCopyWith<$Res> {
  __$HomeBannerCopyWithImpl(this._self, this._then);

  final _HomeBanner _self;
  final $Res Function(_HomeBanner) _then;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tag = null,Object? title = null,Object? color = null,}) {
  return _then(_HomeBanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
