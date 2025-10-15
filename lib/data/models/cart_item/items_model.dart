class ItemsModel {
  final int id;
  final int productId;
  final String title;
  final String size;
  final int price;
  final String image;
  final int quantity;

  ItemsModel({
    required this.id,
    required this.productId,
    required this.title,
    required this.size,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      productId: json['productId'],
      title: json['title'],
      size: json['size'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
    );
  }
}
