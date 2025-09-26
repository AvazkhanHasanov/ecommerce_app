import 'package:ecommerce_app/data/models/add_item_model.dart';
import 'package:ecommerce_app/data/models/product/product_detail_model.dart';
import 'package:ecommerce_app/data/models/reviews_model.dart';
import 'package:ecommerce_app/data/models/reviews_stats_model.dart';
import 'package:ecommerce_app/features/home/managers/home_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.freezed.dart';

@freezed
abstract class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    required Status productStatus,
    required Status reviewsStatus,
    required Status statsStatus,
    required Status addItemStatus,

    required String?errorAddItem,
    required String? errorProduct,
    required String? errorReviews,
    required String? errorStats,

    required AddItemModel?addItem,
    required ProductDetailModel? product,
    required List<ReviewsModel> reviews,
    required ReviewsStatsModel? stats,
  }) = _ProductDetailState;

  factory ProductDetailState.initial() => ProductDetailState(
    productStatus: Status.idle,
    reviewsStatus: Status.idle,
    statsStatus: Status.idle,
    addItemStatus:Status.idle,

    errorAddItem:null,
    errorProduct: null,
    errorReviews: null,
    errorStats: null,

    addItem:null,
    reviews: [],
    stats: null,
    product: null,
  );
}
