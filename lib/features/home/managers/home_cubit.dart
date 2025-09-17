import 'package:ecommerce_app/data/repositories/category_repository.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoryRepository _categoryRepo;
  final ProductRepository _productRepo;

  HomeCubit({required CategoryRepository categoryRepo, required ProductRepository productRepo})
    : _categoryRepo = categoryRepo,
      _productRepo = productRepo,
      super(HomeState.initial()) {
    fetchCategory();
    fetchProducts();
  }

  Future<void> fetchCategory() async {
    emit(state.copyWith(status: Status.loading));
    final result = await _categoryRepo.getAll();
    result.fold(
      (error) {
        emit(state.copyWith(status: Status.error, errorMessage: error.toString()));
      },
      (value) {
        emit(state.copyWith(status: Status.success, category: value));
      },
    );
  }

  Future<void> fetchProducts({Map<String, dynamic>? queryParams}) async {
    emit(state.copyWith(productStatus: Status.loading));
    final result = await _productRepo.getAll(queryParams: queryParams);
    result.fold(
      (error) => emit(
        state.copyWith(productStatus: Status.error, errorProduct: error.toString()),
      ),
      (value) => emit(state.copyWith(productStatus: Status.success, product: value)),
    );
  }
}
