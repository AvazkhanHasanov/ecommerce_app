// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {

 Status get deleteStatus; Status get cartStatus; Status get updateCartStatus; String? get errorDelete; String? get errorCart; String? get updateCartError; MyCartItemsModel? get myCartItems;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&(identical(other.deleteStatus, deleteStatus) || other.deleteStatus == deleteStatus)&&(identical(other.cartStatus, cartStatus) || other.cartStatus == cartStatus)&&(identical(other.updateCartStatus, updateCartStatus) || other.updateCartStatus == updateCartStatus)&&(identical(other.errorDelete, errorDelete) || other.errorDelete == errorDelete)&&(identical(other.errorCart, errorCart) || other.errorCart == errorCart)&&(identical(other.updateCartError, updateCartError) || other.updateCartError == updateCartError)&&(identical(other.myCartItems, myCartItems) || other.myCartItems == myCartItems));
}


@override
int get hashCode => Object.hash(runtimeType,deleteStatus,cartStatus,updateCartStatus,errorDelete,errorCart,updateCartError,myCartItems);

@override
String toString() {
  return 'CartState(deleteStatus: $deleteStatus, cartStatus: $cartStatus, updateCartStatus: $updateCartStatus, errorDelete: $errorDelete, errorCart: $errorCart, updateCartError: $updateCartError, myCartItems: $myCartItems)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 Status deleteStatus, Status cartStatus, Status updateCartStatus, String? errorDelete, String? errorCart, String? updateCartError, MyCartItemsModel? myCartItems
});




}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deleteStatus = null,Object? cartStatus = null,Object? updateCartStatus = null,Object? errorDelete = freezed,Object? errorCart = freezed,Object? updateCartError = freezed,Object? myCartItems = freezed,}) {
  return _then(_self.copyWith(
deleteStatus: null == deleteStatus ? _self.deleteStatus : deleteStatus // ignore: cast_nullable_to_non_nullable
as Status,cartStatus: null == cartStatus ? _self.cartStatus : cartStatus // ignore: cast_nullable_to_non_nullable
as Status,updateCartStatus: null == updateCartStatus ? _self.updateCartStatus : updateCartStatus // ignore: cast_nullable_to_non_nullable
as Status,errorDelete: freezed == errorDelete ? _self.errorDelete : errorDelete // ignore: cast_nullable_to_non_nullable
as String?,errorCart: freezed == errorCart ? _self.errorCart : errorCart // ignore: cast_nullable_to_non_nullable
as String?,updateCartError: freezed == updateCartError ? _self.updateCartError : updateCartError // ignore: cast_nullable_to_non_nullable
as String?,myCartItems: freezed == myCartItems ? _self.myCartItems : myCartItems // ignore: cast_nullable_to_non_nullable
as MyCartItemsModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartState value)  $default,){
final _that = this;
switch (_that) {
case _CartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartState value)?  $default,){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status deleteStatus,  Status cartStatus,  Status updateCartStatus,  String? errorDelete,  String? errorCart,  String? updateCartError,  MyCartItemsModel? myCartItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.deleteStatus,_that.cartStatus,_that.updateCartStatus,_that.errorDelete,_that.errorCart,_that.updateCartError,_that.myCartItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status deleteStatus,  Status cartStatus,  Status updateCartStatus,  String? errorDelete,  String? errorCart,  String? updateCartError,  MyCartItemsModel? myCartItems)  $default,) {final _that = this;
switch (_that) {
case _CartState():
return $default(_that.deleteStatus,_that.cartStatus,_that.updateCartStatus,_that.errorDelete,_that.errorCart,_that.updateCartError,_that.myCartItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status deleteStatus,  Status cartStatus,  Status updateCartStatus,  String? errorDelete,  String? errorCart,  String? updateCartError,  MyCartItemsModel? myCartItems)?  $default,) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.deleteStatus,_that.cartStatus,_that.updateCartStatus,_that.errorDelete,_that.errorCart,_that.updateCartError,_that.myCartItems);case _:
  return null;

}
}

}

/// @nodoc


class _CartState implements CartState {
  const _CartState({required this.deleteStatus, required this.cartStatus, required this.updateCartStatus, required this.errorDelete, required this.errorCart, required this.updateCartError, required this.myCartItems});
  

@override final  Status deleteStatus;
@override final  Status cartStatus;
@override final  Status updateCartStatus;
@override final  String? errorDelete;
@override final  String? errorCart;
@override final  String? updateCartError;
@override final  MyCartItemsModel? myCartItems;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&(identical(other.deleteStatus, deleteStatus) || other.deleteStatus == deleteStatus)&&(identical(other.cartStatus, cartStatus) || other.cartStatus == cartStatus)&&(identical(other.updateCartStatus, updateCartStatus) || other.updateCartStatus == updateCartStatus)&&(identical(other.errorDelete, errorDelete) || other.errorDelete == errorDelete)&&(identical(other.errorCart, errorCart) || other.errorCart == errorCart)&&(identical(other.updateCartError, updateCartError) || other.updateCartError == updateCartError)&&(identical(other.myCartItems, myCartItems) || other.myCartItems == myCartItems));
}


@override
int get hashCode => Object.hash(runtimeType,deleteStatus,cartStatus,updateCartStatus,errorDelete,errorCart,updateCartError,myCartItems);

@override
String toString() {
  return 'CartState(deleteStatus: $deleteStatus, cartStatus: $cartStatus, updateCartStatus: $updateCartStatus, errorDelete: $errorDelete, errorCart: $errorCart, updateCartError: $updateCartError, myCartItems: $myCartItems)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 Status deleteStatus, Status cartStatus, Status updateCartStatus, String? errorDelete, String? errorCart, String? updateCartError, MyCartItemsModel? myCartItems
});




}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deleteStatus = null,Object? cartStatus = null,Object? updateCartStatus = null,Object? errorDelete = freezed,Object? errorCart = freezed,Object? updateCartError = freezed,Object? myCartItems = freezed,}) {
  return _then(_CartState(
deleteStatus: null == deleteStatus ? _self.deleteStatus : deleteStatus // ignore: cast_nullable_to_non_nullable
as Status,cartStatus: null == cartStatus ? _self.cartStatus : cartStatus // ignore: cast_nullable_to_non_nullable
as Status,updateCartStatus: null == updateCartStatus ? _self.updateCartStatus : updateCartStatus // ignore: cast_nullable_to_non_nullable
as Status,errorDelete: freezed == errorDelete ? _self.errorDelete : errorDelete // ignore: cast_nullable_to_non_nullable
as String?,errorCart: freezed == errorCart ? _self.errorCart : errorCart // ignore: cast_nullable_to_non_nullable
as String?,updateCartError: freezed == updateCartError ? _self.updateCartError : updateCartError // ignore: cast_nullable_to_non_nullable
as String?,myCartItems: freezed == myCartItems ? _self.myCartItems : myCartItems // ignore: cast_nullable_to_non_nullable
as MyCartItemsModel?,
  ));
}


}

// dart format on
