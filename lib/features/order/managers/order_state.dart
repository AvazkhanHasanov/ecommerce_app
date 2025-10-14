import 'package:ecommerce_app/data/models/order_model/orders_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.freezed.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({
    required Status ordersStatus,
    required Status reviewStatus,
    required String? reviewError,
    required String? orderError,
    required List<OrdersModel> orders,
  }) = _OrderState;

  factory OrderState.initial() => OrderState(
    ordersStatus: Status.idle,
    orderError: null,
    orders: [],
    reviewStatus: Status.idle,
    reviewError: null,
  );
}
