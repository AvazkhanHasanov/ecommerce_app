
import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/add_item_model.dart';
import 'package:ecommerce_app/data/models/my_cart_items_model.dart';

abstract interface class ICartItemRepository {
  Future<Result<AddItemModel>> addItem({required AddItemModel itemModel});

  Future<Result<MyCartItemsModel>> getMyCartItems();

  Future<Result> deleteMyCart({required int id});
}

class CartItemRepository implements ICartItemRepository {
  final ApiClient _client;

  CartItemRepository({required ApiClient client}) : _client = client;

  @override
  Future<Result<AddItemModel>> addItem({required AddItemModel itemModel}) async {
    final response = await _client.post('/my-cart/add-item', data: itemModel.toJson());

    return response.fold(
          (error) => Result.error(error),
          (value) => Result.ok(itemModel),
    );
  }

  @override
  Future<Result<MyCartItemsModel>> getMyCartItems() async {
    final response = await _client.get('/my-cart/my-cart-items');
    return response.fold(
          (error) => Result.error(error),
          (value) => Result.ok(MyCartItemsModel.fromJson(value)),
    );
  }

  @override
  Future<Result> deleteMyCart({required int id}) async {
    final response = await _client.delete('/my-cart/delete/$id');
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }
}
