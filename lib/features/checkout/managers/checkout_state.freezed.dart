// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {

 Status get checkStatus; Status get cardStatus; String? get cardError; String? get checkError; List<CardsListModel>? get cardList;
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutStateCopyWith<CheckoutState> get copyWith => _$CheckoutStateCopyWithImpl<CheckoutState>(this as CheckoutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState&&(identical(other.checkStatus, checkStatus) || other.checkStatus == checkStatus)&&(identical(other.cardStatus, cardStatus) || other.cardStatus == cardStatus)&&(identical(other.cardError, cardError) || other.cardError == cardError)&&(identical(other.checkError, checkError) || other.checkError == checkError)&&const DeepCollectionEquality().equals(other.cardList, cardList));
}


@override
int get hashCode => Object.hash(runtimeType,checkStatus,cardStatus,cardError,checkError,const DeepCollectionEquality().hash(cardList));

@override
String toString() {
  return 'CheckoutState(checkStatus: $checkStatus, cardStatus: $cardStatus, cardError: $cardError, checkError: $checkError, cardList: $cardList)';
}


}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res>  {
  factory $CheckoutStateCopyWith(CheckoutState value, $Res Function(CheckoutState) _then) = _$CheckoutStateCopyWithImpl;
@useResult
$Res call({
 Status checkStatus, Status cardStatus, String? cardError, String? checkError, List<CardsListModel>? cardList
});




}
/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkStatus = null,Object? cardStatus = null,Object? cardError = freezed,Object? checkError = freezed,Object? cardList = freezed,}) {
  return _then(_self.copyWith(
checkStatus: null == checkStatus ? _self.checkStatus : checkStatus // ignore: cast_nullable_to_non_nullable
as Status,cardStatus: null == cardStatus ? _self.cardStatus : cardStatus // ignore: cast_nullable_to_non_nullable
as Status,cardError: freezed == cardError ? _self.cardError : cardError // ignore: cast_nullable_to_non_nullable
as String?,checkError: freezed == checkError ? _self.checkError : checkError // ignore: cast_nullable_to_non_nullable
as String?,cardList: freezed == cardList ? _self.cardList : cardList // ignore: cast_nullable_to_non_nullable
as List<CardsListModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutState value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutState value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status checkStatus,  Status cardStatus,  String? cardError,  String? checkError,  List<CardsListModel>? cardList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.checkStatus,_that.cardStatus,_that.cardError,_that.checkError,_that.cardList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status checkStatus,  Status cardStatus,  String? cardError,  String? checkError,  List<CardsListModel>? cardList)  $default,) {final _that = this;
switch (_that) {
case _CheckoutState():
return $default(_that.checkStatus,_that.cardStatus,_that.cardError,_that.checkError,_that.cardList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status checkStatus,  Status cardStatus,  String? cardError,  String? checkError,  List<CardsListModel>? cardList)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.checkStatus,_that.cardStatus,_that.cardError,_that.checkError,_that.cardList);case _:
  return null;

}
}

}

/// @nodoc


class _CheckoutState implements CheckoutState {
  const _CheckoutState({required this.checkStatus, required this.cardStatus, required this.cardError, required this.checkError, required final  List<CardsListModel>? cardList}): _cardList = cardList;
  

@override final  Status checkStatus;
@override final  Status cardStatus;
@override final  String? cardError;
@override final  String? checkError;
 final  List<CardsListModel>? _cardList;
@override List<CardsListModel>? get cardList {
  final value = _cardList;
  if (value == null) return null;
  if (_cardList is EqualUnmodifiableListView) return _cardList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutStateCopyWith<_CheckoutState> get copyWith => __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutState&&(identical(other.checkStatus, checkStatus) || other.checkStatus == checkStatus)&&(identical(other.cardStatus, cardStatus) || other.cardStatus == cardStatus)&&(identical(other.cardError, cardError) || other.cardError == cardError)&&(identical(other.checkError, checkError) || other.checkError == checkError)&&const DeepCollectionEquality().equals(other._cardList, _cardList));
}


@override
int get hashCode => Object.hash(runtimeType,checkStatus,cardStatus,cardError,checkError,const DeepCollectionEquality().hash(_cardList));

@override
String toString() {
  return 'CheckoutState(checkStatus: $checkStatus, cardStatus: $cardStatus, cardError: $cardError, checkError: $checkError, cardList: $cardList)';
}


}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(_CheckoutState value, $Res Function(_CheckoutState) _then) = __$CheckoutStateCopyWithImpl;
@override @useResult
$Res call({
 Status checkStatus, Status cardStatus, String? cardError, String? checkError, List<CardsListModel>? cardList
});




}
/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkStatus = null,Object? cardStatus = null,Object? cardError = freezed,Object? checkError = freezed,Object? cardList = freezed,}) {
  return _then(_CheckoutState(
checkStatus: null == checkStatus ? _self.checkStatus : checkStatus // ignore: cast_nullable_to_non_nullable
as Status,cardStatus: null == cardStatus ? _self.cardStatus : cardStatus // ignore: cast_nullable_to_non_nullable
as Status,cardError: freezed == cardError ? _self.cardError : cardError // ignore: cast_nullable_to_non_nullable
as String?,checkError: freezed == checkError ? _self.checkError : checkError // ignore: cast_nullable_to_non_nullable
as String?,cardList: freezed == cardList ? _self._cardList : cardList // ignore: cast_nullable_to_non_nullable
as List<CardsListModel>?,
  ));
}


}

// dart format on
