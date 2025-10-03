// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyDetailState implements DiagnosticableTreeMixin {

 Status get meStatus; Status get updateStatus; String? get updateError; String? get meError; AuthMeModel? get me;
/// Create a copy of MyDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyDetailStateCopyWith<MyDetailState> get copyWith => _$MyDetailStateCopyWithImpl<MyDetailState>(this as MyDetailState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MyDetailState'))
    ..add(DiagnosticsProperty('meStatus', meStatus))..add(DiagnosticsProperty('updateStatus', updateStatus))..add(DiagnosticsProperty('updateError', updateError))..add(DiagnosticsProperty('meError', meError))..add(DiagnosticsProperty('me', me));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyDetailState&&(identical(other.meStatus, meStatus) || other.meStatus == meStatus)&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus)&&(identical(other.updateError, updateError) || other.updateError == updateError)&&(identical(other.meError, meError) || other.meError == meError)&&(identical(other.me, me) || other.me == me));
}


@override
int get hashCode => Object.hash(runtimeType,meStatus,updateStatus,updateError,meError,me);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MyDetailState(meStatus: $meStatus, updateStatus: $updateStatus, updateError: $updateError, meError: $meError, me: $me)';
}


}

/// @nodoc
abstract mixin class $MyDetailStateCopyWith<$Res>  {
  factory $MyDetailStateCopyWith(MyDetailState value, $Res Function(MyDetailState) _then) = _$MyDetailStateCopyWithImpl;
@useResult
$Res call({
 Status meStatus, Status updateStatus, String? updateError, String? meError, AuthMeModel? me
});




}
/// @nodoc
class _$MyDetailStateCopyWithImpl<$Res>
    implements $MyDetailStateCopyWith<$Res> {
  _$MyDetailStateCopyWithImpl(this._self, this._then);

  final MyDetailState _self;
  final $Res Function(MyDetailState) _then;

/// Create a copy of MyDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meStatus = null,Object? updateStatus = null,Object? updateError = freezed,Object? meError = freezed,Object? me = freezed,}) {
  return _then(_self.copyWith(
meStatus: null == meStatus ? _self.meStatus : meStatus // ignore: cast_nullable_to_non_nullable
as Status,updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as Status,updateError: freezed == updateError ? _self.updateError : updateError // ignore: cast_nullable_to_non_nullable
as String?,meError: freezed == meError ? _self.meError : meError // ignore: cast_nullable_to_non_nullable
as String?,me: freezed == me ? _self.me : me // ignore: cast_nullable_to_non_nullable
as AuthMeModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyDetailState].
extension MyDetailStatePatterns on MyDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyDetailState value)  $default,){
final _that = this;
switch (_that) {
case _MyDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _MyDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status meStatus,  Status updateStatus,  String? updateError,  String? meError,  AuthMeModel? me)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyDetailState() when $default != null:
return $default(_that.meStatus,_that.updateStatus,_that.updateError,_that.meError,_that.me);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status meStatus,  Status updateStatus,  String? updateError,  String? meError,  AuthMeModel? me)  $default,) {final _that = this;
switch (_that) {
case _MyDetailState():
return $default(_that.meStatus,_that.updateStatus,_that.updateError,_that.meError,_that.me);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status meStatus,  Status updateStatus,  String? updateError,  String? meError,  AuthMeModel? me)?  $default,) {final _that = this;
switch (_that) {
case _MyDetailState() when $default != null:
return $default(_that.meStatus,_that.updateStatus,_that.updateError,_that.meError,_that.me);case _:
  return null;

}
}

}

/// @nodoc


class _MyDetailState with DiagnosticableTreeMixin implements MyDetailState {
  const _MyDetailState({required this.meStatus, required this.updateStatus, required this.updateError, required this.meError, required this.me});
  

@override final  Status meStatus;
@override final  Status updateStatus;
@override final  String? updateError;
@override final  String? meError;
@override final  AuthMeModel? me;

/// Create a copy of MyDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyDetailStateCopyWith<_MyDetailState> get copyWith => __$MyDetailStateCopyWithImpl<_MyDetailState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MyDetailState'))
    ..add(DiagnosticsProperty('meStatus', meStatus))..add(DiagnosticsProperty('updateStatus', updateStatus))..add(DiagnosticsProperty('updateError', updateError))..add(DiagnosticsProperty('meError', meError))..add(DiagnosticsProperty('me', me));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyDetailState&&(identical(other.meStatus, meStatus) || other.meStatus == meStatus)&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus)&&(identical(other.updateError, updateError) || other.updateError == updateError)&&(identical(other.meError, meError) || other.meError == meError)&&(identical(other.me, me) || other.me == me));
}


@override
int get hashCode => Object.hash(runtimeType,meStatus,updateStatus,updateError,meError,me);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MyDetailState(meStatus: $meStatus, updateStatus: $updateStatus, updateError: $updateError, meError: $meError, me: $me)';
}


}

/// @nodoc
abstract mixin class _$MyDetailStateCopyWith<$Res> implements $MyDetailStateCopyWith<$Res> {
  factory _$MyDetailStateCopyWith(_MyDetailState value, $Res Function(_MyDetailState) _then) = __$MyDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Status meStatus, Status updateStatus, String? updateError, String? meError, AuthMeModel? me
});




}
/// @nodoc
class __$MyDetailStateCopyWithImpl<$Res>
    implements _$MyDetailStateCopyWith<$Res> {
  __$MyDetailStateCopyWithImpl(this._self, this._then);

  final _MyDetailState _self;
  final $Res Function(_MyDetailState) _then;

/// Create a copy of MyDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meStatus = null,Object? updateStatus = null,Object? updateError = freezed,Object? meError = freezed,Object? me = freezed,}) {
  return _then(_MyDetailState(
meStatus: null == meStatus ? _self.meStatus : meStatus // ignore: cast_nullable_to_non_nullable
as Status,updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as Status,updateError: freezed == updateError ? _self.updateError : updateError // ignore: cast_nullable_to_non_nullable
as String?,meError: freezed == meError ? _self.meError : meError // ignore: cast_nullable_to_non_nullable
as String?,me: freezed == me ? _self.me : me // ignore: cast_nullable_to_non_nullable
as AuthMeModel?,
  ));
}


}

// dart format on
