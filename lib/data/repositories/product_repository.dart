import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/product/product_detail_model.dart';
import 'package:ecommerce_app/data/models/product/saved_products_model.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:flutter/rendering.dart';

abstract interface class IProductRepository {
  Future<Result<List<ProductModel>>> getAll({Map<String, dynamic>? queryParams});

  Future<Result<ProductDetailModel>> getById(int id);

  Future<Result<List<SavedProductsModel>>> getSavedProducts({Map<String, dynamic>? queryParams});
}

class ProductRepository implements IProductRepository{
  final ApiClient _client;

  ProductRepository({required ApiClient client}) : _client = client;
@override
  Future<Result<List<ProductModel>>> getAll({Map<String, dynamic>? queryParams}) async {
    final response = await _client.get<List>('/products/list', queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => ProductModel.fromJson(x)).toList()),
    );
  }
  @override
  Future<Result<ProductDetailModel>> getById(int id) async {
    final response = await _client.get('/products/detail/$id');
    return response.fold(
      (error) {
        debugPrint(error.toString());
        return Result.error(error);
      },
      (value) => Result.ok(ProductDetailModel.fromJson(value)),
    );
  }
  @override
  Future<Result<List<SavedProductsModel>>> getSavedProducts({Map<String, dynamic>? queryParams}) async {
    final response = await _client.get<List>('/products/saved-products', queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => SavedProductsModel.fromJson(x)).toList()),
    );
  }
}
