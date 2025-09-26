class CardsCreateModel {
  final String cardNumber;
  final DateTime expiryDate;
  final String securityCode;

  CardsCreateModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });

  Map<String, dynamic> toJson() {
    return {
      "cardNumber": cardNumber,
      'expiryDate': expiryDate,
      'securityCode': securityCode,
    };
  }
}
