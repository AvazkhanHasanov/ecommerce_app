import 'package:ecommerce_app/data/models/my_cart_items_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    required Status deleteStatus,
    required Status cartStatus,
    required String?errorDelete,
    required String? errorCart,
    required MyCartItemsModel? myCartItems,
  }) = _CartState;

  factory CartState.initial() => CartState(
    deleteStatus: Status.idle,
    cartStatus: Status.loading,
    errorDelete: null,
    errorCart: null,
    myCartItems: null,
  );
}
