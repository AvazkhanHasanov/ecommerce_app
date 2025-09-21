import 'package:ecommerce_app/data/models/product/product_images_model.dart';
import 'package:ecommerce_app/data/models/product/product_sizes_model.dart';

class ProductDetailModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final bool isLiked;
  final int reviewsCount;
  final num rating;
  final List<ProductImagesModel> productImages;
  final List<ProductSizesModel> productSizes;

  ProductDetailModel({
    required this.price,
    required this.productSizes,
    required this.productImages,
    required this.id,
    required this.title,
    required this.description,
    required this.isLiked,
    required this.reviewsCount,
    required this.rating,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      isLiked: json['isLiked'],
      reviewsCount: json['reviewsCount'],
      rating: json['rating'],
      productSizes: (json['productSizes'] as List).map((x) => ProductSizesModel.fromJson(x)).toList(),
      productImages: (json['productImages'] as List).map((x) => ProductImagesModel.fromJson(x)).toList(),
    );
  }
}
