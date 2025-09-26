class CardsListModel {
  final int id;
  final String cardNumber;

  CardsListModel({
    required this.id,
    required this.cardNumber,
  });

  factory CardsListModel.fromJson(Map<String, dynamic> json) {
    return CardsListModel(
      id: json['id'],
      cardNumber: json['cardNumber'],
    );
  }
}
