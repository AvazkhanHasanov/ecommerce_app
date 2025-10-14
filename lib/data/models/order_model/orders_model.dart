class OrdersModel {
  final int id;
  final String title;
  final String image;
  final String size;
  final int price;
  final String status;
  final double rating;

  OrdersModel({
    required this.id,
    required this.title,
    required this.image,
    required this.size,
    required this.price,
    required this.status,
    required this.rating,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      size: json['size'],
      price: json['price'],
      status: json['status'],
      rating: json['rating'] ?? 0.0,
    );
  }
}
