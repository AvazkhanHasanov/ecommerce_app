import 'package:ecommerce_app/data/models/product/product_images_model.dart';
import 'package:ecommerce_app/data/models/product/product_sizes_model.dart';

class ProductModel {
  final int id;
  final int categoryId;
  final String image;
  final String title;
  final int price;
  final bool isLiked;
  final num discount;
  final List<ProductImagesModel> productImages;
  final List<ProductSizesModel> productSizes;

  ProductModel({
    required this.productSizes,
    required this.productImages,
    required this.id,
    required this.categoryId,
    required this.image,
    required this.title,
    required this.price,
    required this.isLiked,
    required this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productSizes: json['productSizes'] != null
          ? (json['productSizes'] as List).map((x) => ProductSizesModel.fromJson(x)).toList()
          : [],
      productImages: json['productImages'] != null
          ? (json['productImages'] as List).map((x) => ProductImagesModel.fromJson(x)).toList()
          : [],
      id: json['id'],
      categoryId: json['categoryId'],
      image: json['image'],
      title: json['title'],
      price: json['price'],
      isLiked: json['isLiked'],
      discount: json['discount'],
    );
  }

  ProductModel copyWith({
    int? id,
    int? categoryId,
    String? image,
    String? title,
    int? price,
    bool? isLiked,
    num? discount,
    List<ProductImagesModel>? productImages,
    List<ProductSizesModel>? productSizes,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      productSizes: productSizes ?? this.productSizes,
      productImages: productImages ?? this.productImages,
      image: image ?? this.image,
      title: title ?? this.title,
      price: price ?? this.price,
      isLiked: isLiked ?? this.isLiked,
      discount: discount ?? this.discount,
    );
  }
}
