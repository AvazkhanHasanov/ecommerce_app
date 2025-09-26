class AddItemModel {
  final int productId;
  final int sizeId;

  AddItemModel({required this.productId, required this.sizeId});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'sizeId': sizeId,
    };
  }
}
