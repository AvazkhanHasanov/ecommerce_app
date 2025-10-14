import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/address_model/address_create_model.dart';
import 'package:ecommerce_app/data/repositories/address_repository.dart';
import 'package:ecommerce_app/features/new_address/manager/new_address_state.dart';

part 'new_address_event.dart';

class NewAddressBloc extends Bloc<NewAddressEvent, NewAddressState> {
  final AddressRepository _addressRepo;

  NewAddressBloc({required AddressRepository addressRepo})
    : _addressRepo = addressRepo,
      super(NewAddressState.initial()) {
    on<CreateAddress>(_createAddress);
  }

  Future<void> _createAddress(CreateAddress event, Emitter<NewAddressState> emit) async {
    emit(state.copyWith(newAddressStatus: Status.loading));
    final result = await _addressRepo.addressCreate(createData: event.data);
    result.fold(
      (error) => emit(state.copyWith(newAddressStatus: Status.error, newAddressError: error.toString())),
      (value) => emit(state.copyWith(newAddressStatus: Status.success)),
    );
  }
}
