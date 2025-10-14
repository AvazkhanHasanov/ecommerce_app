import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/order_model/orders_create_model.dart';
import 'package:ecommerce_app/data/models/order_model/orders_model.dart';

class OrderRepository {
  final ApiClient _client;

  OrderRepository({required ApiClient client}) : _client = client;

  Future<Result> create({required OrdersCreateModel orderData}) async {
    final response = await _client.post('/orders/create', data: orderData.toJson());
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value),
    );
  }

  Future<Result<List<OrdersModel>>> getOrders() async {
    final response = await _client.get<List>('/orders/list');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => OrdersModel.fromJson(x)).toList()),
    );
  }

  Future<Result> deleteOrder({required int id}) async {
    final response = await _client.delete('/orders/delete/$id');
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }
}
