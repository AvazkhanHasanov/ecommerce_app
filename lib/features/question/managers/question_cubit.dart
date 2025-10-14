import 'package:ecommerce_app/data/repositories/question_category_repository.dart';
import 'package:ecommerce_app/data/repositories/question_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/question/managers/question_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final QuestionRepository _questionRepo;
  final QuestionCategoryRepository _categoryRepo;

  QuestionCubit({
    required QuestionRepository questionRepo,
    required QuestionCategoryRepository categoryRepo,
  }) : _questionRepo = questionRepo,
       _categoryRepo = categoryRepo,
       super(QuestionState.initial()) {
    fetchQuestion();
    fetchCategory();
  }

  Future<void> fetchQuestion({Map<String, dynamic>? queryParams}) async {
    emit(state.copyWith(questionStatus: Status.loading));
    final result = await _questionRepo.getAll(queryParams: queryParams);
    result.fold(
      (error) => emit(state.copyWith(questionError: error.toString(), questionStatus: Status.error)),
      (value) => emit(state.copyWith(questionStatus: Status.success, question: value)),
    );
  }

  Future<void> fetchCategory() async {
    emit(state.copyWith(categoryStatus: Status.loading));
    final result = await _categoryRepo.getAll();
    result.fold(
      (error) => emit(state.copyWith(categoryStatus: Status.error, categoryError: error.toString())),
      (value) => emit(state.copyWith(categoryStatus: Status.success, category: value)),
    );
  }
}
