import 'package:ecommerce_app/data/models/items_model.dart';

class MyCartItemsModel {
  final List<ItemsModel> items;
  final int subTotal;
  final int vat;
  final int shippingFee;
  final int total;

  MyCartItemsModel({
    required this.items,
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  factory MyCartItemsModel.fromJson(Map<String, dynamic> json) {
    return MyCartItemsModel(
      items: (json['items'] as List).map((x) => ItemsModel.fromJson(x)).toList(),
      subTotal: json['subTotal'],
      vat: json['vat'],
      shippingFee: json['shippingFee'],
      total: json['total'],
    );
  }
}
