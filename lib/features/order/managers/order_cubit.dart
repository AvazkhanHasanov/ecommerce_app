import 'package:ecommerce_app/data/models/review/reviews_create_model.dart';
import 'package:ecommerce_app/data/repositories/order_repository.dart';
import 'package:ecommerce_app/data/repositories/reviews_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/order/managers/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepo;
  final ReviewsRepository _reviewsRepo;

  OrderCubit({required OrderRepository orderRepo, required ReviewsRepository reviewsRepo})
    : _reviewsRepo = reviewsRepo,
      _orderRepo = orderRepo,
      super(OrderState.initial()) {
    fetchOrder();
  }

  Future<void> fetchOrder() async {
    emit(state.copyWith(ordersStatus: Status.loading));
    final result = await _orderRepo.getOrders();
    result.fold(
      (error) => emit(state.copyWith(ordersStatus: Status.error, orderError: error.toString())),
      (value) => emit(state.copyWith(ordersStatus: Status.success, orders: value, orderError: null)),
    );
  }

  Future<void> createReview({required ReviewsCreateModel data}) async {
    emit(state.copyWith(reviewStatus: Status.loading));
    final result = await _reviewsRepo.createReviews(data: data);
    result.fold(
      (error) => emit(state.copyWith(reviewStatus: Status.error, reviewError: error.toString())),
      (value) => emit(state.copyWith(reviewStatus: Status.success, reviewError: null)),
    );
  }
}
