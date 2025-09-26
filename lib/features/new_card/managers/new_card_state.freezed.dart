// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewCardState {

 Status get statusCardsCreate; String? get errorCardsCreate;
/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewCardStateCopyWith<NewCardState> get copyWith => _$NewCardStateCopyWithImpl<NewCardState>(this as NewCardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewCardState&&(identical(other.statusCardsCreate, statusCardsCreate) || other.statusCardsCreate == statusCardsCreate)&&(identical(other.errorCardsCreate, errorCardsCreate) || other.errorCardsCreate == errorCardsCreate));
}


@override
int get hashCode => Object.hash(runtimeType,statusCardsCreate,errorCardsCreate);

@override
String toString() {
  return 'NewCardState(statusCardsCreate: $statusCardsCreate, errorCardsCreate: $errorCardsCreate)';
}


}

/// @nodoc
abstract mixin class $NewCardStateCopyWith<$Res>  {
  factory $NewCardStateCopyWith(NewCardState value, $Res Function(NewCardState) _then) = _$NewCardStateCopyWithImpl;
@useResult
$Res call({
 Status statusCardsCreate, String? errorCardsCreate
});




}
/// @nodoc
class _$NewCardStateCopyWithImpl<$Res>
    implements $NewCardStateCopyWith<$Res> {
  _$NewCardStateCopyWithImpl(this._self, this._then);

  final NewCardState _self;
  final $Res Function(NewCardState) _then;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCardsCreate = null,Object? errorCardsCreate = freezed,}) {
  return _then(_self.copyWith(
statusCardsCreate: null == statusCardsCreate ? _self.statusCardsCreate : statusCardsCreate // ignore: cast_nullable_to_non_nullable
as Status,errorCardsCreate: freezed == errorCardsCreate ? _self.errorCardsCreate : errorCardsCreate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewCardState].
extension NewCardStatePatterns on NewCardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewCardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewCardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewCardState value)  $default,){
final _that = this;
switch (_that) {
case _NewCardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewCardState value)?  $default,){
final _that = this;
switch (_that) {
case _NewCardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status statusCardsCreate,  String? errorCardsCreate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewCardState() when $default != null:
return $default(_that.statusCardsCreate,_that.errorCardsCreate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status statusCardsCreate,  String? errorCardsCreate)  $default,) {final _that = this;
switch (_that) {
case _NewCardState():
return $default(_that.statusCardsCreate,_that.errorCardsCreate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status statusCardsCreate,  String? errorCardsCreate)?  $default,) {final _that = this;
switch (_that) {
case _NewCardState() when $default != null:
return $default(_that.statusCardsCreate,_that.errorCardsCreate);case _:
  return null;

}
}

}

/// @nodoc


class _NewCardState implements NewCardState {
  const _NewCardState({required this.statusCardsCreate, required this.errorCardsCreate});
  

@override final  Status statusCardsCreate;
@override final  String? errorCardsCreate;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewCardStateCopyWith<_NewCardState> get copyWith => __$NewCardStateCopyWithImpl<_NewCardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewCardState&&(identical(other.statusCardsCreate, statusCardsCreate) || other.statusCardsCreate == statusCardsCreate)&&(identical(other.errorCardsCreate, errorCardsCreate) || other.errorCardsCreate == errorCardsCreate));
}


@override
int get hashCode => Object.hash(runtimeType,statusCardsCreate,errorCardsCreate);

@override
String toString() {
  return 'NewCardState(statusCardsCreate: $statusCardsCreate, errorCardsCreate: $errorCardsCreate)';
}


}

/// @nodoc
abstract mixin class _$NewCardStateCopyWith<$Res> implements $NewCardStateCopyWith<$Res> {
  factory _$NewCardStateCopyWith(_NewCardState value, $Res Function(_NewCardState) _then) = __$NewCardStateCopyWithImpl;
@override @useResult
$Res call({
 Status statusCardsCreate, String? errorCardsCreate
});




}
/// @nodoc
class __$NewCardStateCopyWithImpl<$Res>
    implements _$NewCardStateCopyWith<$Res> {
  __$NewCardStateCopyWithImpl(this._self, this._then);

  final _NewCardState _self;
  final $Res Function(_NewCardState) _then;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCardsCreate = null,Object? errorCardsCreate = freezed,}) {
  return _then(_NewCardState(
statusCardsCreate: null == statusCardsCreate ? _self.statusCardsCreate : statusCardsCreate // ignore: cast_nullable_to_non_nullable
as Status,errorCardsCreate: freezed == errorCardsCreate ? _self.errorCardsCreate : errorCardsCreate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
