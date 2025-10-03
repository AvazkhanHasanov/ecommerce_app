class AuthUpdateModel {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String gender;
  final String? birthDate;

  AuthUpdateModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
  });

  factory AuthUpdateModel.fromJson(Map<String, dynamic> json) {
    return AuthUpdateModel(
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      birthDate: json['birthDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'birthDate': birthDate,
    };
  }
}
