// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFlowState {

 AuthMode get mode; String get phoneInput; String get firstName; String get lastName; int? get birthMonth; int? get birthDay; int? get birthYear; bool get isExistingUser; bool get isLoading; bool get phoneNotRegistered; bool get hasError;
/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFlowStateCopyWith<AuthFlowState> get copyWith => _$AuthFlowStateCopyWithImpl<AuthFlowState>(this as AuthFlowState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AuthFlowState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFlowState&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.phoneInput, _this.phoneInput) || other.phoneInput == _this.phoneInput)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.birthMonth, _this.birthMonth) || other.birthMonth == _this.birthMonth)&&(identical(other.birthDay, _this.birthDay) || other.birthDay == _this.birthDay)&&(identical(other.birthYear, _this.birthYear) || other.birthYear == _this.birthYear)&&(identical(other.isExistingUser, _this.isExistingUser) || other.isExistingUser == _this.isExistingUser)&&(identical(other.isLoading, _this.isLoading) || other.isLoading == _this.isLoading)&&(identical(other.phoneNotRegistered, _this.phoneNotRegistered) || other.phoneNotRegistered == _this.phoneNotRegistered)&&(identical(other.hasError, _this.hasError) || other.hasError == _this.hasError));
}


@override
int get hashCode {
  final _this = this as AuthFlowState;
  return Object.hash(runtimeType,_this.mode,_this.phoneInput,_this.firstName,_this.lastName,_this.birthMonth,_this.birthDay,_this.birthYear,_this.isExistingUser,_this.isLoading,_this.phoneNotRegistered,_this.hasError);
}

@override
String toString() {
  final _this = this as AuthFlowState;
  return 'AuthFlowState(mode: ${_this.mode}, phoneInput: ${_this.phoneInput}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, birthMonth: ${_this.birthMonth}, birthDay: ${_this.birthDay}, birthYear: ${_this.birthYear}, isExistingUser: ${_this.isExistingUser}, isLoading: ${_this.isLoading}, phoneNotRegistered: ${_this.phoneNotRegistered}, hasError: ${_this.hasError})';
}


}

/// @nodoc
abstract mixin class $AuthFlowStateCopyWith<$Res>  {
  factory $AuthFlowStateCopyWith(AuthFlowState value, $Res Function(AuthFlowState) _then) = _$AuthFlowStateCopyWithImpl;
@useResult
$Res call({
 AuthMode mode, String phoneInput, String firstName, String lastName, int? birthMonth, int? birthDay, int? birthYear, bool isExistingUser, bool isLoading, bool phoneNotRegistered, bool hasError
});




}
/// @nodoc
class _$AuthFlowStateCopyWithImpl<$Res>
    implements $AuthFlowStateCopyWith<$Res> {
  _$AuthFlowStateCopyWithImpl(this._self, this._then);

  final AuthFlowState _self;
  final $Res Function(AuthFlowState) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? phoneInput = null,Object? firstName = null,Object? lastName = null,Object? birthMonth = freezed,Object? birthDay = freezed,Object? birthYear = freezed,Object? isExistingUser = null,Object? isLoading = null,Object? phoneNotRegistered = null,Object? hasError = null,}) {
  return _then(AuthFlowState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,phoneInput: null == phoneInput ? _self.phoneInput : phoneInput // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,birthMonth: freezed == birthMonth ? _self.birthMonth : birthMonth // ignore: cast_nullable_to_non_nullable
as int?,birthDay: freezed == birthDay ? _self.birthDay : birthDay // ignore: cast_nullable_to_non_nullable
as int?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,isExistingUser: null == isExistingUser ? _self.isExistingUser : isExistingUser // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,phoneNotRegistered: null == phoneNotRegistered ? _self.phoneNotRegistered : phoneNotRegistered // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthFlowState].
extension AuthFlowStatePatterns on AuthFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthFlowState value)  $default,){
final _that = this;
switch (_that) {
case _AuthFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthMode mode,  String phoneInput,  String firstName,  String lastName,  int? birthMonth,  int? birthDay,  int? birthYear,  bool isExistingUser,  bool isLoading,  bool phoneNotRegistered,  bool hasError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
return $default(_that.mode,_that.phoneInput,_that.firstName,_that.lastName,_that.birthMonth,_that.birthDay,_that.birthYear,_that.isExistingUser,_that.isLoading,_that.phoneNotRegistered,_that.hasError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthMode mode,  String phoneInput,  String firstName,  String lastName,  int? birthMonth,  int? birthDay,  int? birthYear,  bool isExistingUser,  bool isLoading,  bool phoneNotRegistered,  bool hasError)  $default,) {final _that = this;
switch (_that) {
case _AuthFlowState():
return $default(_that.mode,_that.phoneInput,_that.firstName,_that.lastName,_that.birthMonth,_that.birthDay,_that.birthYear,_that.isExistingUser,_that.isLoading,_that.phoneNotRegistered,_that.hasError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthMode mode,  String phoneInput,  String firstName,  String lastName,  int? birthMonth,  int? birthDay,  int? birthYear,  bool isExistingUser,  bool isLoading,  bool phoneNotRegistered,  bool hasError)?  $default,) {final _that = this;
switch (_that) {
case _AuthFlowState() when $default != null:
return $default(_that.mode,_that.phoneInput,_that.firstName,_that.lastName,_that.birthMonth,_that.birthDay,_that.birthYear,_that.isExistingUser,_that.isLoading,_that.phoneNotRegistered,_that.hasError);case _:
  return null;

}
}

}

/// @nodoc


class _AuthFlowState extends AuthFlowState {
  const _AuthFlowState({this.mode = AuthMode.register, this.phoneInput = '', this.firstName = '', this.lastName = '', this.birthMonth, this.birthDay, this.birthYear, this.isExistingUser = false, this.isLoading = false, this.phoneNotRegistered = false, this.hasError = false}): super._();
  

@override@JsonKey() final  AuthMode mode;
@override@JsonKey() final  String phoneInput;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override final  int? birthMonth;
@override final  int? birthDay;
@override final  int? birthYear;
@override@JsonKey() final  bool isExistingUser;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool phoneNotRegistered;
@override@JsonKey() final  bool hasError;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFlowStateCopyWith<_AuthFlowState> get copyWith => __$AuthFlowStateCopyWithImpl<_AuthFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.phoneInput, phoneInput) || other.phoneInput == phoneInput)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.birthMonth, birthMonth) || other.birthMonth == birthMonth)&&(identical(other.birthDay, birthDay) || other.birthDay == birthDay)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.isExistingUser, isExistingUser) || other.isExistingUser == isExistingUser)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.phoneNotRegistered, phoneNotRegistered) || other.phoneNotRegistered == phoneNotRegistered)&&(identical(other.hasError, hasError) || other.hasError == hasError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,phoneInput,firstName,lastName,birthMonth,birthDay,birthYear,isExistingUser,isLoading,phoneNotRegistered,hasError);
}

@override
String toString() {
    return 'AuthFlowState(mode: $mode, phoneInput: $phoneInput, firstName: $firstName, lastName: $lastName, birthMonth: $birthMonth, birthDay: $birthDay, birthYear: $birthYear, isExistingUser: $isExistingUser, isLoading: $isLoading, phoneNotRegistered: $phoneNotRegistered, hasError: $hasError)';
}


}

/// @nodoc
abstract mixin class _$AuthFlowStateCopyWith<$Res> implements $AuthFlowStateCopyWith<$Res> {
  factory _$AuthFlowStateCopyWith(_AuthFlowState value, $Res Function(_AuthFlowState) _then) = __$AuthFlowStateCopyWithImpl;
@override @useResult
$Res call({
 AuthMode mode, String phoneInput, String firstName, String lastName, int? birthMonth, int? birthDay, int? birthYear, bool isExistingUser, bool isLoading, bool phoneNotRegistered, bool hasError
});




}
/// @nodoc
class __$AuthFlowStateCopyWithImpl<$Res>
    implements _$AuthFlowStateCopyWith<$Res> {
  __$AuthFlowStateCopyWithImpl(this._self, this._then);

  final _AuthFlowState _self;
  final $Res Function(_AuthFlowState) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? phoneInput = null,Object? firstName = null,Object? lastName = null,Object? birthMonth = freezed,Object? birthDay = freezed,Object? birthYear = freezed,Object? isExistingUser = null,Object? isLoading = null,Object? phoneNotRegistered = null,Object? hasError = null,}) {
  return _then(_AuthFlowState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,phoneInput: null == phoneInput ? _self.phoneInput : phoneInput // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,birthMonth: freezed == birthMonth ? _self.birthMonth : birthMonth // ignore: cast_nullable_to_non_nullable
as int?,birthDay: freezed == birthDay ? _self.birthDay : birthDay // ignore: cast_nullable_to_non_nullable
as int?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,isExistingUser: null == isExistingUser ? _self.isExistingUser : isExistingUser // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,phoneNotRegistered: null == phoneNotRegistered ? _self.phoneNotRegistered : phoneNotRegistered // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
