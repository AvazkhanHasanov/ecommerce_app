// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentState implements DiagnosticableTreeMixin {

 Status get statusCards; String? get errorCards; List<CardsListModel> get cards;
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStateCopyWith<PaymentState> get copyWith => _$PaymentStateCopyWithImpl<PaymentState>(this as PaymentState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaymentState'))
    ..add(DiagnosticsProperty('statusCards', statusCards))..add(DiagnosticsProperty('errorCards', errorCards))..add(DiagnosticsProperty('cards', cards));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState&&(identical(other.statusCards, statusCards) || other.statusCards == statusCards)&&(identical(other.errorCards, errorCards) || other.errorCards == errorCards)&&const DeepCollectionEquality().equals(other.cards, cards));
}


@override
int get hashCode => Object.hash(runtimeType,statusCards,errorCards,const DeepCollectionEquality().hash(cards));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaymentState(statusCards: $statusCards, errorCards: $errorCards, cards: $cards)';
}


}

/// @nodoc
abstract mixin class $PaymentStateCopyWith<$Res>  {
  factory $PaymentStateCopyWith(PaymentState value, $Res Function(PaymentState) _then) = _$PaymentStateCopyWithImpl;
@useResult
$Res call({
 Status statusCards, String? errorCards, List<CardsListModel> cards
});




}
/// @nodoc
class _$PaymentStateCopyWithImpl<$Res>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._self, this._then);

  final PaymentState _self;
  final $Res Function(PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCards = null,Object? errorCards = freezed,Object? cards = null,}) {
  return _then(_self.copyWith(
statusCards: null == statusCards ? _self.statusCards : statusCards // ignore: cast_nullable_to_non_nullable
as Status,errorCards: freezed == errorCards ? _self.errorCards : errorCards // ignore: cast_nullable_to_non_nullable
as String?,cards: null == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as List<CardsListModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status statusCards,  String? errorCards,  List<CardsListModel> cards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.statusCards,_that.errorCards,_that.cards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status statusCards,  String? errorCards,  List<CardsListModel> cards)  $default,) {final _that = this;
switch (_that) {
case _PaymentState():
return $default(_that.statusCards,_that.errorCards,_that.cards);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status statusCards,  String? errorCards,  List<CardsListModel> cards)?  $default,) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.statusCards,_that.errorCards,_that.cards);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentState with DiagnosticableTreeMixin implements PaymentState {
  const _PaymentState({required this.statusCards, required this.errorCards, required final  List<CardsListModel> cards}): _cards = cards;
  

@override final  Status statusCards;
@override final  String? errorCards;
 final  List<CardsListModel> _cards;
@override List<CardsListModel> get cards {
  if (_cards is EqualUnmodifiableListView) return _cards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cards);
}


/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentStateCopyWith<_PaymentState> get copyWith => __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaymentState'))
    ..add(DiagnosticsProperty('statusCards', statusCards))..add(DiagnosticsProperty('errorCards', errorCards))..add(DiagnosticsProperty('cards', cards));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentState&&(identical(other.statusCards, statusCards) || other.statusCards == statusCards)&&(identical(other.errorCards, errorCards) || other.errorCards == errorCards)&&const DeepCollectionEquality().equals(other._cards, _cards));
}


@override
int get hashCode => Object.hash(runtimeType,statusCards,errorCards,const DeepCollectionEquality().hash(_cards));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaymentState(statusCards: $statusCards, errorCards: $errorCards, cards: $cards)';
}


}

/// @nodoc
abstract mixin class _$PaymentStateCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(_PaymentState value, $Res Function(_PaymentState) _then) = __$PaymentStateCopyWithImpl;
@override @useResult
$Res call({
 Status statusCards, String? errorCards, List<CardsListModel> cards
});




}
/// @nodoc
class __$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(this._self, this._then);

  final _PaymentState _self;
  final $Res Function(_PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCards = null,Object? errorCards = freezed,Object? cards = null,}) {
  return _then(_PaymentState(
statusCards: null == statusCards ? _self.statusCards : statusCards // ignore: cast_nullable_to_non_nullable
as Status,errorCards: freezed == errorCards ? _self.errorCards : errorCards // ignore: cast_nullable_to_non_nullable
as String?,cards: null == cards ? _self._cards : cards // ignore: cast_nullable_to_non_nullable
as List<CardsListModel>,
  ));
}


}

// dart format on
