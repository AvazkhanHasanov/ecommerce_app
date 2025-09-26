import 'package:ecommerce_app/data/models/card/cards_list_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';
@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    required Status statusCards,
    required String? errorCards,
    required List<CardsListModel> cards,
  }) = _PaymentState;

  factory PaymentState.initial() => PaymentState(
    statusCards: Status.idle,
    errorCards: null,
    cards: [],
  );
}
