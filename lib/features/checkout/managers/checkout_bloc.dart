import 'package:ecommerce_app/data/models/order_model/orders_create_model.dart';
import 'package:ecommerce_app/data/repositories/address_repository.dart';
import 'package:ecommerce_app/data/repositories/card_repository.dart';
import 'package:ecommerce_app/data/repositories/order_repository.dart';
import 'package:ecommerce_app/features/checkout/managers/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/managers/home_state.dart';

part 'checkout_event.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final OrderRepository _orderRepo;
  final AddressRepository _addressRepo;
  final CardRepository _cardRepo;

  CheckoutBloc({
    required OrderRepository orderRepo,
    required AddressRepository addressRepo,
    required CardRepository cardRepo,
  }) : _orderRepo = orderRepo,
       _addressRepo = addressRepo,
       _cardRepo = cardRepo,
       super(CheckoutState.initial()) {
    on<FetchAddress>(_fetchAddress);
    on<FetchCards>(_fetchCard);
    on<CreateOrder>(_orderCreate);
  }

  Future<void> _fetchAddress(FetchAddress event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(addressStatus: Status.loading));
    final result = await _addressRepo.getAddress();
    result.fold(
      (error) => emit(state.copyWith(addressStatus: Status.error, addressError: error.toString())),
      (value) => emit(state.copyWith(addressStatus: Status.success, addressError: null, addressList: value)),
    );
  }

  Future<void> _fetchCard(FetchCards event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(cardStatus: Status.loading));
    final result = await _cardRepo.getAllCards();
    result.fold(
      (error) => emit(state.copyWith(cardStatus: Status.error, cardError: error.toString())),
      (value) => emit(state.copyWith(cardStatus: Status.success, cardError: null, cardList: value)),
    );
  }

  Future<void> _orderCreate(CreateOrder event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(orderStatus: Status.loading));
    final result = await _orderRepo.create(orderData: event.data);
    result.fold(
      (error) => emit(state.copyWith(orderStatus: Status.error, orderError: error.toString())),
      (value) => emit(state.copyWith(orderError: null, orderStatus: Status.success)),
    );
  }
}
