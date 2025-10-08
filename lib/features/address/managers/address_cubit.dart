import 'package:ecommerce_app/data/repositories/address_repository.dart';
import 'package:ecommerce_app/features/address/managers/address_state.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepository _addressRepo;

  AddressCubit({required AddressRepository addressRepo}) : _addressRepo = addressRepo, super(AddressState.initial()) {
    fetchAddress();
  }

  Future<void> fetchAddress() async {
    emit(state.copyWith(status: Status.loading));
    final result = await _addressRepo.getAddress();
    result.fold(
      (error) => emit(state.copyWith(status: Status.error, errorMessage: error.toString())),
      (value) => emit(state.copyWith(address: value, errorMessage: null, status: Status.success)),
    );
  }
}
