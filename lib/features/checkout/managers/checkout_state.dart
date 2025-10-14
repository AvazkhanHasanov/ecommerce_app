import 'package:ecommerce_app/data/models/address_model/address_model.dart';
import 'package:ecommerce_app/data/models/card/cards_list_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.freezed.dart';

@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required Status addressStatus,
    required Status orderStatus,
    required Status cardStatus,

    required String? addressError,
    required String? cardError,
    required String? orderError,

    required List<AddressModel>? addressList,
    required List<CardsListModel>? cardList,
  }) = _CheckoutState;

  factory CheckoutState.initial() => CheckoutState(
    addressStatus: Status.idle,
    orderStatus: Status.idle,
    cardStatus: Status.idle,
    addressError: null,
    cardError: null,
    orderError: null,
    cardList: [],
    addressList: [],
  );
}
