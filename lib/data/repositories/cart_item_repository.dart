import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/cart_item/add_item_model.dart';
import 'package:ecommerce_app/data/models/cart_item/my_cart_items_model.dart';

abstract interface class ICartItemRepository {
  Future<Result<AddItemModel>> addItem({required AddItemModel itemModel});

  Future<Result<MyCartItemsModel>> getMyCartItems();

  Future<Result> deleteMyCart({required int id});

  Future<Result> update({required int id, required int quantity});
}

class CartItemRepository implements ICartItemRepository {
  final ApiClient _client;

  CartItemRepository({required ApiClient client}) : _client = client;

  @override
  Future<Result<AddItemModel>> addItem({required AddItemModel itemModel}) async {
    final response = await _client.post('/cart-items', data: itemModel.toJson());

    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(itemModel),
    );
  }

  @override
  Future<Result<MyCartItemsModel>> getMyCartItems() async {
    final response = await _client.get('/cart-items');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(MyCartItemsModel.fromJson(value)),
    );
  }


  @override
  Future<Result> update({required int id, required int quantity}) async {
    final response = await _client.patch('/cart-items/$id', data: {'quantity': quantity});
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }

  @override
  Future<Result> deleteMyCart({required int id}) async {
    final response = await _client.delete('/cart-items/$id');
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }
}
