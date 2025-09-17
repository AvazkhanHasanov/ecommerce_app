import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/auth_model/product_model.dart';

class ProductRepository {
  final ApiClient _client;

  ProductRepository({required ApiClient client}) : _client = client;

  Future<Result<List<ProductModel>>> getAll({Map<String, dynamic>? queryParams}) async {
    final response = await _client.get<List>('/products/list', queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => ProductModel.fromJson(x)).toList()),
    );
  }
}
