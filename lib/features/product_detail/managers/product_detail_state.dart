import 'package:ecommerce_app/data/models/product/product_detail_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.freezed.dart';

@freezed
abstract class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    required Status status,
    required String? errorProduct,
    required ProductDetailModel? product,
  }) = _ProductDetailState;

  factory ProductDetailState.initial() => ProductDetailState(status: Status.idle, errorProduct: null, product: null);
}
