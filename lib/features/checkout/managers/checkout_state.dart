import 'package:ecommerce_app/data/models/card/cards_list_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.freezed.dart';
@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required Status checkStatus,
    required Status cardStatus,
    required String? cardError,
    required String? checkError,
    required List<CardsListModel>? cardList,
  }) = _CheckoutState;

  factory CheckoutState.initial() => CheckoutState(
    checkStatus: Status.idle,
    cardStatus: Status.idle,
    cardError: null,
    checkError: null,
    cardList: [],
  );
}
