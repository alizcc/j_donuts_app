// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Member {

 String get id; MemberTier get tier; int get points; int get nextTierPoints; int get tierStartPoints; int get notificationCount; int get rewardCount;
/// Create a copy of Member
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberCopyWith<Member> get copyWith => _$MemberCopyWithImpl<Member>(this as Member, _$identity);

  /// Serializes this Member to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Member;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Member&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.nextTierPoints, _this.nextTierPoints) || other.nextTierPoints == _this.nextTierPoints)&&(identical(other.tierStartPoints, _this.tierStartPoints) || other.tierStartPoints == _this.tierStartPoints)&&(identical(other.notificationCount, _this.notificationCount) || other.notificationCount == _this.notificationCount)&&(identical(other.rewardCount, _this.rewardCount) || other.rewardCount == _this.rewardCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Member;
  return Object.hash(runtimeType,_this.id,_this.tier,_this.points,_this.nextTierPoints,_this.tierStartPoints,_this.notificationCount,_this.rewardCount);
}

@override
String toString() {
  final _this = this as Member;
  return 'Member(id: ${_this.id}, tier: ${_this.tier}, points: ${_this.points}, nextTierPoints: ${_this.nextTierPoints}, tierStartPoints: ${_this.tierStartPoints}, notificationCount: ${_this.notificationCount}, rewardCount: ${_this.rewardCount})';
}


}

/// @nodoc
abstract mixin class $MemberCopyWith<$Res>  {
  factory $MemberCopyWith(Member value, $Res Function(Member) _then) = _$MemberCopyWithImpl;
@useResult
$Res call({
 String id, MemberTier tier, int points, int nextTierPoints, int tierStartPoints, int notificationCount, int rewardCount
});




}
/// @nodoc
class _$MemberCopyWithImpl<$Res>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._self, this._then);

  final Member _self;
  final $Res Function(Member) _then;

/// Create a copy of Member
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tier = null,Object? points = null,Object? nextTierPoints = null,Object? tierStartPoints = null,Object? notificationCount = null,Object? rewardCount = null,}) {
  return _then(Member(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as MemberTier,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,nextTierPoints: null == nextTierPoints ? _self.nextTierPoints : nextTierPoints // ignore: cast_nullable_to_non_nullable
as int,tierStartPoints: null == tierStartPoints ? _self.tierStartPoints : tierStartPoints // ignore: cast_nullable_to_non_nullable
as int,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,rewardCount: null == rewardCount ? _self.rewardCount : rewardCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Member].
extension MemberPatterns on Member {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Member value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Member() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Member value)  $default,){
final _that = this;
switch (_that) {
case _Member():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Member value)?  $default,){
final _that = this;
switch (_that) {
case _Member() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MemberTier tier,  int points,  int nextTierPoints,  int tierStartPoints,  int notificationCount,  int rewardCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Member() when $default != null:
return $default(_that.id,_that.tier,_that.points,_that.nextTierPoints,_that.tierStartPoints,_that.notificationCount,_that.rewardCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MemberTier tier,  int points,  int nextTierPoints,  int tierStartPoints,  int notificationCount,  int rewardCount)  $default,) {final _that = this;
switch (_that) {
case _Member():
return $default(_that.id,_that.tier,_that.points,_that.nextTierPoints,_that.tierStartPoints,_that.notificationCount,_that.rewardCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MemberTier tier,  int points,  int nextTierPoints,  int tierStartPoints,  int notificationCount,  int rewardCount)?  $default,) {final _that = this;
switch (_that) {
case _Member() when $default != null:
return $default(_that.id,_that.tier,_that.points,_that.nextTierPoints,_that.tierStartPoints,_that.notificationCount,_that.rewardCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Member extends Member {
  const _Member({required this.id, required this.tier, required this.points, required this.nextTierPoints, this.tierStartPoints = 0, this.notificationCount = 0, this.rewardCount = 0}): super._();
  factory _Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

@override final  String id;
@override final  MemberTier tier;
@override final  int points;
@override final  int nextTierPoints;
@override@JsonKey() final  int tierStartPoints;
@override@JsonKey() final  int notificationCount;
@override@JsonKey() final  int rewardCount;

/// Create a copy of Member
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberCopyWith<_Member> get copyWith => __$MemberCopyWithImpl<_Member>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Member&&(identical(other.id, id) || other.id == id)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.points, points) || other.points == points)&&(identical(other.nextTierPoints, nextTierPoints) || other.nextTierPoints == nextTierPoints)&&(identical(other.tierStartPoints, tierStartPoints) || other.tierStartPoints == tierStartPoints)&&(identical(other.notificationCount, notificationCount) || other.notificationCount == notificationCount)&&(identical(other.rewardCount, rewardCount) || other.rewardCount == rewardCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tier,points,nextTierPoints,tierStartPoints,notificationCount,rewardCount);
}

@override
String toString() {
    return 'Member(id: $id, tier: $tier, points: $points, nextTierPoints: $nextTierPoints, tierStartPoints: $tierStartPoints, notificationCount: $notificationCount, rewardCount: $rewardCount)';
}


}

/// @nodoc
abstract mixin class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) _then) = __$MemberCopyWithImpl;
@override @useResult
$Res call({
 String id, MemberTier tier, int points, int nextTierPoints, int tierStartPoints, int notificationCount, int rewardCount
});




}
/// @nodoc
class __$MemberCopyWithImpl<$Res>
    implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(this._self, this._then);

  final _Member _self;
  final $Res Function(_Member) _then;

/// Create a copy of Member
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tier = null,Object? points = null,Object? nextTierPoints = null,Object? tierStartPoints = null,Object? notificationCount = null,Object? rewardCount = null,}) {
  return _then(_Member(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as MemberTier,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,nextTierPoints: null == nextTierPoints ? _self.nextTierPoints : nextTierPoints // ignore: cast_nullable_to_non_nullable
as int,tierStartPoints: null == tierStartPoints ? _self.tierStartPoints : tierStartPoints // ignore: cast_nullable_to_non_nullable
as int,notificationCount: null == notificationCount ? _self.notificationCount : notificationCount // ignore: cast_nullable_to_non_nullable
as int,rewardCount: null == rewardCount ? _self.rewardCount : rewardCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
