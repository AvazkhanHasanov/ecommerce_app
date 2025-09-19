import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/repositories/category_repository.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoryRepository _categoryRepo;
  final ProductRepository _productRepo;

  final AuthRepository _authRepo;

  HomeCubit({
    required CategoryRepository categoryRepo,
    required ProductRepository productRepo,
    required AuthRepository authRepo,
  }) : _categoryRepo = categoryRepo,
       _productRepo = productRepo,
       _authRepo = authRepo,
       super(HomeState.initial()) {
    fetchCategory();
    fetchProducts();
  }

  Future<void> fetchCategory() async {
    emit(state.copyWith(status: Status.loading));
    final result = await _categoryRepo.getAll();
    result.fold(
      (error) => emit(state.copyWith(status: Status.error, errorMessage: error.toString())),
      (value) => emit(state.copyWith(status: Status.success, category: value)),
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

  Future<void> toggleLike(int productId) async {
    final index = state.product.indexWhere((element) => element.id == productId);
    if (index == -1) return;

    final current = state.product[index];
    final newStatus = !current.isLiked;

    final updatedProduct = current.copyWith(isLiked: newStatus);
    final updatedList = [...state.product];
    updatedList[index] = updatedProduct;
    emit(state.copyWith(product: updatedList));

    final result = newStatus ? await _authRepo.save(id: productId) : await _authRepo.unsave(id: productId);

    result.fold((error) {
      updatedList[index] = current;
      emit(state.copyWith(product: updatedList));
    }, (_) {});
  }
}
