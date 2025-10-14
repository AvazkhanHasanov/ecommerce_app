class AddressCreateModel {
  final String nickname;
  final String fullAddress;
  final num lat;
  final num lng;
  final bool isDefault;

  AddressCreateModel({
    required this.nickname,
    required this.fullAddress,
    required this.lat,
    required this.lng,
    required this.isDefault,
  });

  factory AddressCreateModel.fromJson(Map<String, dynamic> json) {
    return AddressCreateModel(
      nickname: json['nickname'],
      fullAddress: json['fullAddress'],
      lat: json['lat'],
      lng: json['lng'],
      isDefault: json['isDefault'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'fullAddress': fullAddress,
      'lat': lat,
      'lng': lng,
      'isDefault': isDefault,
    };
  }
}
