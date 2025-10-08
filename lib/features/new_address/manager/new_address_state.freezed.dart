// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewAddressState {

 Status get newAddressStatus; String? get newAddressError;
/// Create a copy of NewAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewAddressStateCopyWith<NewAddressState> get copyWith => _$NewAddressStateCopyWithImpl<NewAddressState>(this as NewAddressState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewAddressState&&(identical(other.newAddressStatus, newAddressStatus) || other.newAddressStatus == newAddressStatus)&&(identical(other.newAddressError, newAddressError) || other.newAddressError == newAddressError));
}


@override
int get hashCode => Object.hash(runtimeType,newAddressStatus,newAddressError);

@override
String toString() {
  return 'NewAddressState(newAddressStatus: $newAddressStatus, newAddressError: $newAddressError)';
}


}

/// @nodoc
abstract mixin class $NewAddressStateCopyWith<$Res>  {
  factory $NewAddressStateCopyWith(NewAddressState value, $Res Function(NewAddressState) _then) = _$NewAddressStateCopyWithImpl;
@useResult
$Res call({
 Status newAddressStatus, String? newAddressError
});




}
/// @nodoc
class _$NewAddressStateCopyWithImpl<$Res>
    implements $NewAddressStateCopyWith<$Res> {
  _$NewAddressStateCopyWithImpl(this._self, this._then);

  final NewAddressState _self;
  final $Res Function(NewAddressState) _then;

/// Create a copy of NewAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newAddressStatus = null,Object? newAddressError = freezed,}) {
  return _then(_self.copyWith(
newAddressStatus: null == newAddressStatus ? _self.newAddressStatus : newAddressStatus // ignore: cast_nullable_to_non_nullable
as Status,newAddressError: freezed == newAddressError ? _self.newAddressError : newAddressError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewAddressState].
extension NewAddressStatePatterns on NewAddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewAddressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewAddressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewAddressState value)  $default,){
final _that = this;
switch (_that) {
case _NewAddressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewAddressState value)?  $default,){
final _that = this;
switch (_that) {
case _NewAddressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status newAddressStatus,  String? newAddressError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewAddressState() when $default != null:
return $default(_that.newAddressStatus,_that.newAddressError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status newAddressStatus,  String? newAddressError)  $default,) {final _that = this;
switch (_that) {
case _NewAddressState():
return $default(_that.newAddressStatus,_that.newAddressError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status newAddressStatus,  String? newAddressError)?  $default,) {final _that = this;
switch (_that) {
case _NewAddressState() when $default != null:
return $default(_that.newAddressStatus,_that.newAddressError);case _:
  return null;

}
}

}

/// @nodoc


class _NewAddressState implements NewAddressState {
  const _NewAddressState({required this.newAddressStatus, required this.newAddressError});
  

@override final  Status newAddressStatus;
@override final  String? newAddressError;

/// Create a copy of NewAddressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewAddressStateCopyWith<_NewAddressState> get copyWith => __$NewAddressStateCopyWithImpl<_NewAddressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewAddressState&&(identical(other.newAddressStatus, newAddressStatus) || other.newAddressStatus == newAddressStatus)&&(identical(other.newAddressError, newAddressError) || other.newAddressError == newAddressError));
}


@override
int get hashCode => Object.hash(runtimeType,newAddressStatus,newAddressError);

@override
String toString() {
  return 'NewAddressState(newAddressStatus: $newAddressStatus, newAddressError: $newAddressError)';
}


}

/// @nodoc
abstract mixin class _$NewAddressStateCopyWith<$Res> implements $NewAddressStateCopyWith<$Res> {
  factory _$NewAddressStateCopyWith(_NewAddressState value, $Res Function(_NewAddressState) _then) = __$NewAddressStateCopyWithImpl;
@override @useResult
$Res call({
 Status newAddressStatus, String? newAddressError
});




}
/// @nodoc
class __$NewAddressStateCopyWithImpl<$Res>
    implements _$NewAddressStateCopyWith<$Res> {
  __$NewAddressStateCopyWithImpl(this._self, this._then);

  final _NewAddressState _self;
  final $Res Function(_NewAddressState) _then;

/// Create a copy of NewAddressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newAddressStatus = null,Object? newAddressError = freezed,}) {
  return _then(_NewAddressState(
newAddressStatus: null == newAddressStatus ? _self.newAddressStatus : newAddressStatus // ignore: cast_nullable_to_non_nullable
as Status,newAddressError: freezed == newAddressError ? _self.newAddressError : newAddressError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
