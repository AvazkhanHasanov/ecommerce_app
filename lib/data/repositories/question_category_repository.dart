import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/question_category_model.dart';

class QuestionCategoryRepository {
  final ApiClient _client;

  QuestionCategoryRepository({required ApiClient client}) : _client = client;

  Future<Result<List<QuestionCategoryModel>>> getAll() async {
    final response = await _client.get<List>('/question-categories');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => QuestionCategoryModel.fromJson(x)).toList()),
    );
  }
}
