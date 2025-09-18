import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/saved/managers/saved_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedCubit extends Cubit<SavedState> {
  final ProductRepository _productRepo;

  SavedCubit({required ProductRepository productRepo}) : _productRepo = productRepo, super(SavedState.initial());

  Future<void> fetchSavedProducts() async {
    emit(state.copyWith(status: Status.loading));
    final result = await _productRepo.getSavedProducts();
    result.fold(
      (error) => emit(state.copyWith(status: Status.error, errorSavedMessage: error.toString())),
      (value) => emit(state.copyWith(status: Status.success, savedProducts: value)),
    );
  }
}
