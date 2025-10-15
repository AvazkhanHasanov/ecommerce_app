import 'package:ecommerce_app/data/repositories/cart_item_repository.dart';
import 'package:ecommerce_app/features/cart/managers/cart_state.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartItemRepository _myCartItemsRepo;

  CartBloc({required CartItemRepository myCartItemsRepo})
    : _myCartItemsRepo = myCartItemsRepo,
      super(CartState.initial()) {
    on<GetMyCartItems>(_fetchMyCartItems);
    on<DeleteMyCart>(_deleteMyCart);
    on<UpdateMyCart>(
      _updateMyCart,
      transformer: (events, mapper) => events.debounceTime(Duration(milliseconds: 400)).switchMap(mapper),
    );
  }

  Future<void> _fetchMyCartItems(GetMyCartItems event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartStatus: Status.loading));
    final result = await _myCartItemsRepo.getMyCartItems();

    result.fold(
      (error) => emit(state.copyWith(cartStatus: Status.error, errorCart: error.toString())),
      (value) => emit(state.copyWith(cartStatus: Status.success, myCartItems: value, errorCart: null)),
    );
  }

  Future<void> _deleteMyCart(DeleteMyCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(deleteStatus: Status.idle));
    final result = await _myCartItemsRepo.deleteMyCart(id: event.id);
    result.fold(
      (error) => emit(state.copyWith(deleteStatus: Status.error, errorDelete: error.toString())),
      (value) {
        add(GetMyCartItems());
        emit(state.copyWith(deleteStatus: Status.success));
      },
    );
  }

  Future<void> _updateMyCart(UpdateMyCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(updateCartStatus: Status.loading));
    final result = await _myCartItemsRepo.update(id: event.id, quantity: event.quantity);
    result.fold(
      (error) => emit(state.copyWith(updateCartStatus: Status.error, updateCartError: error.toString())),
      (value) {
        add(GetMyCartItems());
        emit(state.copyWith(updateCartError: null, updateCartStatus: Status.success));
      },
    );
  }
}
