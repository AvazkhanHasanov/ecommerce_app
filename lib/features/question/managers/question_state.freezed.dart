// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionState implements DiagnosticableTreeMixin {

 Status get questionStatus; Status get categoryStatus; String? get questionError; String? get categoryError; List<QuestionModel> get question; List<QuestionCategoryModel> get category;
/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionStateCopyWith<QuestionState> get copyWith => _$QuestionStateCopyWithImpl<QuestionState>(this as QuestionState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuestionState'))
    ..add(DiagnosticsProperty('questionStatus', questionStatus))..add(DiagnosticsProperty('categoryStatus', categoryStatus))..add(DiagnosticsProperty('questionError', questionError))..add(DiagnosticsProperty('categoryError', categoryError))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('category', category));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionState&&(identical(other.questionStatus, questionStatus) || other.questionStatus == questionStatus)&&(identical(other.categoryStatus, categoryStatus) || other.categoryStatus == categoryStatus)&&(identical(other.questionError, questionError) || other.questionError == questionError)&&(identical(other.categoryError, categoryError) || other.categoryError == categoryError)&&const DeepCollectionEquality().equals(other.question, question)&&const DeepCollectionEquality().equals(other.category, category));
}


@override
int get hashCode => Object.hash(runtimeType,questionStatus,categoryStatus,questionError,categoryError,const DeepCollectionEquality().hash(question),const DeepCollectionEquality().hash(category));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuestionState(questionStatus: $questionStatus, categoryStatus: $categoryStatus, questionError: $questionError, categoryError: $categoryError, question: $question, category: $category)';
}


}

/// @nodoc
abstract mixin class $QuestionStateCopyWith<$Res>  {
  factory $QuestionStateCopyWith(QuestionState value, $Res Function(QuestionState) _then) = _$QuestionStateCopyWithImpl;
@useResult
$Res call({
 Status questionStatus, Status categoryStatus, String? questionError, String? categoryError, List<QuestionModel> question, List<QuestionCategoryModel> category
});




}
/// @nodoc
class _$QuestionStateCopyWithImpl<$Res>
    implements $QuestionStateCopyWith<$Res> {
  _$QuestionStateCopyWithImpl(this._self, this._then);

  final QuestionState _self;
  final $Res Function(QuestionState) _then;

/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionStatus = null,Object? categoryStatus = null,Object? questionError = freezed,Object? categoryError = freezed,Object? question = null,Object? category = null,}) {
  return _then(_self.copyWith(
questionStatus: null == questionStatus ? _self.questionStatus : questionStatus // ignore: cast_nullable_to_non_nullable
as Status,categoryStatus: null == categoryStatus ? _self.categoryStatus : categoryStatus // ignore: cast_nullable_to_non_nullable
as Status,questionError: freezed == questionError ? _self.questionError : questionError // ignore: cast_nullable_to_non_nullable
as String?,categoryError: freezed == categoryError ? _self.categoryError : categoryError // ignore: cast_nullable_to_non_nullable
as String?,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<QuestionCategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionState].
extension QuestionStatePatterns on QuestionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionState value)  $default,){
final _that = this;
switch (_that) {
case _QuestionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionState value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status questionStatus,  Status categoryStatus,  String? questionError,  String? categoryError,  List<QuestionModel> question,  List<QuestionCategoryModel> category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionState() when $default != null:
return $default(_that.questionStatus,_that.categoryStatus,_that.questionError,_that.categoryError,_that.question,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status questionStatus,  Status categoryStatus,  String? questionError,  String? categoryError,  List<QuestionModel> question,  List<QuestionCategoryModel> category)  $default,) {final _that = this;
switch (_that) {
case _QuestionState():
return $default(_that.questionStatus,_that.categoryStatus,_that.questionError,_that.categoryError,_that.question,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status questionStatus,  Status categoryStatus,  String? questionError,  String? categoryError,  List<QuestionModel> question,  List<QuestionCategoryModel> category)?  $default,) {final _that = this;
switch (_that) {
case _QuestionState() when $default != null:
return $default(_that.questionStatus,_that.categoryStatus,_that.questionError,_that.categoryError,_that.question,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _QuestionState with DiagnosticableTreeMixin implements QuestionState {
  const _QuestionState({required this.questionStatus, required this.categoryStatus, required this.questionError, required this.categoryError, required final  List<QuestionModel> question, required final  List<QuestionCategoryModel> category}): _question = question,_category = category;
  

@override final  Status questionStatus;
@override final  Status categoryStatus;
@override final  String? questionError;
@override final  String? categoryError;
 final  List<QuestionModel> _question;
@override List<QuestionModel> get question {
  if (_question is EqualUnmodifiableListView) return _question;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_question);
}

 final  List<QuestionCategoryModel> _category;
@override List<QuestionCategoryModel> get category {
  if (_category is EqualUnmodifiableListView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_category);
}


/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionStateCopyWith<_QuestionState> get copyWith => __$QuestionStateCopyWithImpl<_QuestionState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuestionState'))
    ..add(DiagnosticsProperty('questionStatus', questionStatus))..add(DiagnosticsProperty('categoryStatus', categoryStatus))..add(DiagnosticsProperty('questionError', questionError))..add(DiagnosticsProperty('categoryError', categoryError))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('category', category));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionState&&(identical(other.questionStatus, questionStatus) || other.questionStatus == questionStatus)&&(identical(other.categoryStatus, categoryStatus) || other.categoryStatus == categoryStatus)&&(identical(other.questionError, questionError) || other.questionError == questionError)&&(identical(other.categoryError, categoryError) || other.categoryError == categoryError)&&const DeepCollectionEquality().equals(other._question, _question)&&const DeepCollectionEquality().equals(other._category, _category));
}


@override
int get hashCode => Object.hash(runtimeType,questionStatus,categoryStatus,questionError,categoryError,const DeepCollectionEquality().hash(_question),const DeepCollectionEquality().hash(_category));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuestionState(questionStatus: $questionStatus, categoryStatus: $categoryStatus, questionError: $questionError, categoryError: $categoryError, question: $question, category: $category)';
}


}

/// @nodoc
abstract mixin class _$QuestionStateCopyWith<$Res> implements $QuestionStateCopyWith<$Res> {
  factory _$QuestionStateCopyWith(_QuestionState value, $Res Function(_QuestionState) _then) = __$QuestionStateCopyWithImpl;
@override @useResult
$Res call({
 Status questionStatus, Status categoryStatus, String? questionError, String? categoryError, List<QuestionModel> question, List<QuestionCategoryModel> category
});




}
/// @nodoc
class __$QuestionStateCopyWithImpl<$Res>
    implements _$QuestionStateCopyWith<$Res> {
  __$QuestionStateCopyWithImpl(this._self, this._then);

  final _QuestionState _self;
  final $Res Function(_QuestionState) _then;

/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionStatus = null,Object? categoryStatus = null,Object? questionError = freezed,Object? categoryError = freezed,Object? question = null,Object? category = null,}) {
  return _then(_QuestionState(
questionStatus: null == questionStatus ? _self.questionStatus : questionStatus // ignore: cast_nullable_to_non_nullable
as Status,categoryStatus: null == categoryStatus ? _self.categoryStatus : categoryStatus // ignore: cast_nullable_to_non_nullable
as Status,questionError: freezed == questionError ? _self.questionError : questionError // ignore: cast_nullable_to_non_nullable
as String?,categoryError: freezed == categoryError ? _self.categoryError : categoryError // ignore: cast_nullable_to_non_nullable
as String?,question: null == question ? _self._question : question // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,category: null == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<QuestionCategoryModel>,
  ));
}


}

// dart format on
