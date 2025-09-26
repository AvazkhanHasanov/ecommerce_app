part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent {}

class GetProductById extends ProductDetailEvent {
  final int id;
  GetProductById({required this.id});
}

class GetReviewsStat extends ProductDetailEvent {
  final int productId;

  GetReviewsStat({required this.productId});
}

class GetReviews extends ProductDetailEvent {
  final int productId;

  GetReviews({required this.productId});
}
class AddItem extends ProductDetailEvent{
  final AddItemModel item;
  AddItem({required this.item});
}
