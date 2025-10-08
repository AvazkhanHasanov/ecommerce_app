import 'package:ecommerce_app/data/models/address_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_state.freezed.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    required Status status,
    required String? errorMessage,
    required List<AddressModel> address,
  }) = _AddressState;

  factory AddressState.initial() => AddressState(
    status: Status.idle,
    errorMessage: null,
    address: [],
  );
}
