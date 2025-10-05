class AddressCreateModel {
  final String title;
  final String fullAddress;
  final num lat;
  final num ing;
  final bool isDefault;

  AddressCreateModel({
    required this.title,
    required this.fullAddress,
    required this.lat,
    required this.ing,
    required this.isDefault,
  });

  factory AddressCreateModel.fromJson(Map<String, dynamic> json) {
    return AddressCreateModel(
      title: json['title'],
      fullAddress: json['fullAddress'],
      lat: json['lat'],
      ing: json['ing'],
      isDefault: json['isDefault'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'fullAddress': fullAddress,
      'lat': lat,
      'ing': ing,
      'isDefault': isDefault,
    };
  }
}
