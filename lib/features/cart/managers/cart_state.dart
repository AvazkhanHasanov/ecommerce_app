import 'package:ecommerce_app/data/models/cart_item/my_cart_items_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    required Status deleteStatus,
    required Status cartStatus,
    required Status updateCartStatus,
    required String? errorDelete,
    required String? errorCart,
    required String? updateCartError,
    required MyCartItemsModel? myCartItems,
  }) = _CartState;

  factory CartState.initial() => CartState(
    deleteStatus: Status.idle,

    cartStatus: Status.loading,
    updateCartStatus: Status.idle,

    errorDelete: null,
    errorCart: null,
    updateCartError: null,
    myCartItems: null,
  );
}
