import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/product_detail/managers/product_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_detail_event.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository _productRepo;

  ProductDetailBloc({required ProductRepository productRepo})
    : _productRepo = productRepo,
      super(ProductDetailState.initial()) {
    on<GetProductById>(_fetchProductDetail);
  }

  Future<void> _fetchProductDetail(GetProductById event, Emitter<ProductDetailState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _productRepo.getById(event.id);
    result.fold(
      (error) => emit(state.copyWith(status: Status.error, errorProduct: error.toString())),
      (value) => emit(state.copyWith(status: Status.success, product: value, errorProduct: null)),
    );
  }
}
