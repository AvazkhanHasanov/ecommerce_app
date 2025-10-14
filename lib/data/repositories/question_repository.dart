import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/question_model.dart';

class QuestionRepository {
  final ApiClient _client;

  QuestionRepository({required ApiClient client}) : _client = client;

  Future<Result<List<QuestionModel>>> getAll({Map<String, dynamic>? queryParams}) async {
    final response = await _client.get<List>('/questions', queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => QuestionModel.fromJson(x)).toList()),
    );
  }
}
