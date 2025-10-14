import 'package:ecommerce_app/data/models/question_category_model.dart';
import 'package:ecommerce_app/data/models/question_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_state.freezed.dart';
@freezed
abstract class QuestionState with _$QuestionState {
  const factory QuestionState({
    required Status questionStatus,
    required Status categoryStatus,
    required String? questionError,
    required String? categoryError,
    required List<QuestionModel> question,
    required List<QuestionCategoryModel> category,
  }) = _QuestionState;

  factory QuestionState.initial() => QuestionState(
    questionStatus: Status.idle,
    categoryStatus: Status.idle,
    questionError: null,
    categoryError: null,
    question: [],
    category: [],
  );
}
