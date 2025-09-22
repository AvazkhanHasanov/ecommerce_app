import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/data/repositories/reviews_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:ecommerce_app/features/product_detail/managers/product_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_detail_event.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository _productRepo;
  final ReviewsRepository _reviewsRepo;

  ProductDetailBloc({required ProductRepository productRepo, required ReviewsRepository reviewsRepo})
    : _productRepo = productRepo,
      _reviewsRepo = reviewsRepo,
      super(ProductDetailState.initial()) {
    on<GetProductById>(_fetchProductDetail);
    on<GetReviews>(_fetchReviews);
    on<GetReviewsStat>(_fetchStats);
  }

  Future<void> _fetchProductDetail(GetProductById event, Emitter<ProductDetailState> emit) async {
    emit(state.copyWith(productStatus: Status.loading));
    final result = await _productRepo.getById(event.id);
    result.fold(
      (error) => emit(state.copyWith(productStatus: Status.error, errorProduct: error.toString())),
      (value) => emit(state.copyWith(productStatus: Status.success, product: value, errorProduct: null)),
    );
  }

  Future<void> _fetchReviews(GetReviews event, Emitter<ProductDetailState> emit) async {
    emit(state.copyWith(reviewsStatus: Status.loading));
    final result = await _reviewsRepo.getAll(event.productId);
    result.fold(
      (error) => emit(state.copyWith(reviewsStatus: Status.error, errorReviews: error.toString())),
      (value) => emit(state.copyWith(reviewsStatus: Status.success, reviews: value, errorReviews: null)),
    );
  }

  Future<void> _fetchStats(GetReviewsStat event, Emitter<ProductDetailState> emit) async {
    emit(state.copyWith(statsStatus: Status.loading));
    final result = await _reviewsRepo.getStats(event.productId);
    result.fold(
      (error) => emit(state.copyWith(statsStatus: Status.error, errorStats: error.toString())),
      (value) => emit(state.copyWith(statsStatus: Status.success, stats: value, errorStats: null)),
    );
  }
}
