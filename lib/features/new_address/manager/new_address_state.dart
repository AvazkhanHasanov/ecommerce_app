import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_address_state.freezed.dart';
@freezed
abstract class NewAddressState with _$NewAddressState {
  const factory NewAddressState({required Status newAddressStatus, required String? newAddressError}) =
      _NewAddressState;

  factory NewAddressState.initial() => NewAddressState(newAddressStatus: Status.idle, newAddressError: null);
}
