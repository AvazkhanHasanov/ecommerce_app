part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent {}

class GetProductById extends ProductDetailEvent {
  final int id;

  GetProductById({required this.id});
}
