import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/data/models/cateogry_model.dart';
import 'package:ecommerce_app/data/models/size_model.dart';
import 'package:equatable/equatable.dart';

enum Status { idle, loading, success, error }

class HomeState extends Equatable {
  final Status status;
  final Status productStatus;
  // final Status sizeStatus;
  final String? errorMessage;
  final String? errorProduct;
  // final String? sizeError;


  final List<CategoryModel> category;
  final List<ProductModel> product;
// final List<SizeModel> sizeList;
  const HomeState({
    required this.status,
    required this.errorMessage,
    required this.category,
    required this.productStatus,
    required this.errorProduct,
    required this.product,
  });

  factory HomeState.initial() => HomeState(
    status: Status.success,

    productStatus: Status.idle,
    errorProduct: null,
    errorMessage: null,
    product: [],
    category: [],
  );

  HomeState copyWith({
    Status? status,
    Status? productStatus,
    String? errorProduct,
    String? errorMessage,
    List<ProductModel>? product,
    List<CategoryModel>? category,
  }) {
    return HomeState(
      status: status ?? this.status,
      productStatus: productStatus ?? this.productStatus,

      errorMessage: errorMessage ?? this.errorMessage,
      errorProduct: errorProduct ?? this.errorProduct,

      category: category ?? this.category,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [status, productStatus, errorProduct, errorMessage, product, category];
}
