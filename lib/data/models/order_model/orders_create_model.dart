class OrdersCreateModel {
  final int addressId;
  final String paymentMethod;
  final int cardId;

  OrdersCreateModel({
    required this.addressId,
    required this.paymentMethod,
    required this.cardId,
  });

  factory OrdersCreateModel.fromJson(Map<String, dynamic> json) {
    return OrdersCreateModel(
      addressId: json['addressId'],
      paymentMethod: json['paymentMethod'],
      cardId: json['cardId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressId': addressId,
      'paymentMethod': paymentMethod,
      'cardId': cardId,
    };
  }
}
