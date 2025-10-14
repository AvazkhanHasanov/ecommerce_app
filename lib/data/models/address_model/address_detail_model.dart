class AddressDetailMode {
  final int id;
  final String nickname;
  final String fullAddress;
  final num lat;
  final num lng;
  final bool isDefault;

  AddressDetailMode({
    required this.id,
    required this.nickname,
    required this.fullAddress,
    required this.lat,
    required this.lng,
    required this.isDefault,
  });

  factory AddressDetailMode.fromJson(Map<String, dynamic> json) {
    return AddressDetailMode(
      id: json['id'],
      nickname: json['nickname'],
      fullAddress: json['fullAddress'],
      lat: json['lat'],
      lng: json['lng'],
      isDefault: json['isDefault'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'fullAddress': fullAddress,
      'lat': lat,
      'lng': lng,
      'isDefault': isDefault,
    };
  }
}
