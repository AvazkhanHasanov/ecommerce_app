class ResetPasswordModel {
  final String email;

  ResetPasswordModel({required this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}

class EnterModel {
  final String email;
  final String code;

  EnterModel({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}

class ResetModel {
  final String email;
  final String code;
  final String password;

  ResetModel({
    required this.email,
    required this.code,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
      'password': password,
    };
  }
}
