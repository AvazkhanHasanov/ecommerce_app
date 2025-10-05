import 'package:ecommerce_app/data/repositories/order_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/order/managers/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepo;

  OrderCubit({required OrderRepository orderRepo}) : _orderRepo = orderRepo, super(OrderState.initial());

  Future<void> fetchOrder() async {
    emit(state.copyWith(ordersStatus: Status.loading));
    final result = await _orderRepo.getOrders();
    result.fold(
      (error) => emit(state.copyWith(ordersStatus: Status.error, orderError: error.toString())),
      (value) => emit(state.copyWith(ordersStatus: Status.success, orders: value, orderError: null)),
    );
  }
}
