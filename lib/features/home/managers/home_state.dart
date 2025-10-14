import 'package:ecommerce_app/data/models/product/product_model.dart';
import 'package:ecommerce_app/data/models/cateogry_model.dart';
import 'package:ecommerce_app/data/models/size_model.dart';
import 'package:equatable/equatable.dart';

enum Status { idle, loading, success, error }

class HomeState extends Equatable {
  final Status status;
  final Status productStatus;
  final Status sizeStatus;


  final String? errorMessage;
  final String? errorProduct;

  final String? sizeError;



  final List<CategoryModel> category;
  final List<ProductModel> product;

  final List<SizeModel> sizeList;

  const HomeState({
    required this.sizeStatus,
    required this.status,
    required this.productStatus,

    required this.errorMessage,
    required this.errorProduct,
    required this.sizeError,

    required this.sizeList,
    required this.category,
    required this.product,
  });

  factory HomeState.initial() => HomeState(
    status: Status.idle,
    sizeStatus: Status.loading,
    productStatus: Status.idle,

    sizeError: null,
    errorProduct: null,
    errorMessage: null,

    sizeList: [],
    product: [],
    category: [],
  );

  HomeState copyWith({
    Status? status,
    Status? productStatus,
    Status? sizeStatus,

    String? errorProduct,
    String? errorMessage,
    String? sizeError,

    List<SizeModel>? sizeList,
    List<ProductModel>? product,
    List<CategoryModel>? category,
  }) {
    return HomeState(
      sizeStatus: status ?? this.sizeStatus,
      status: status ?? this.status,
      productStatus: productStatus ?? this.productStatus,

      sizeError: sizeError ?? this.sizeError,
      errorMessage: errorMessage ?? this.errorMessage,
      errorProduct: errorProduct ?? this.errorProduct,

      sizeList: sizeList ?? this.sizeList,
      category: category ?? this.category,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [
    status,
    productStatus,
    sizeStatus,

    errorProduct,
    errorMessage,
    sizeError,

    sizeList,
    product,
    category,
  ];
}
