import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/cateogry_model.dart';

abstract interface class ICategoryRepository {
  Future<Result<List<CategoryModel>>> getAll();
}

class CategoryRepository implements ICategoryRepository {
  final ApiClient _client;

  CategoryRepository({required ApiClient client}) : _client = client;

  @override
  Future<Result<List<CategoryModel>>> getAll() async {
    final response = await _client.get<List>('/categories/list');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => CategoryModel.fromJson(x)).toList()),
    );
  }
}
