import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/auth_model/reset_password_model.dart';
import 'package:ecommerce_app/data/models/auth_model/sign_up_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/auth_model/login_model.dart';

class AuthRepository {
  final ApiClient _client;
  final FlutterSecureStorage _secureStorage;

  AuthRepository({
    required FlutterSecureStorage secureStorage,
    required ApiClient client,
  }) : _client = client,
       _secureStorage = secureStorage;

  Future<Result<String>> add({required SignUpModel signUpData}) async {
    final response = await _client.post<Map<String, dynamic>>('/auth/register', data: signUpData.toJson());
    return response.fold(
      (error) => Result.error(error),
      (value) {
        final token = value['accessToken'];
        _secureStorage.write(key: 'token', value: token);
        _secureStorage.write(key: 'login', value: signUpData.email);
        _secureStorage.write(key: 'password', value: signUpData.password);
        return Result.ok(token);
      },
    );
  }

  Future<Result<String>> login({required LoginModel loginData}) async {
    final response = await _client.post<Map<String, dynamic>>('/auth/login', data: loginData.toJson());
    return response.fold(
      (error) => Result.error(error),
      (value) {
        final token = value['accessToken'];
        _secureStorage.write(key: 'token', value: token);
        _secureStorage.write(key: 'login', value: loginData.login);
        _secureStorage.write(key: 'password', value: loginData.password);
        return Result.ok(token);
      },
    );
  }

  Future<Result<String>> sendResetEmail({required ResetPasswordModel resetPasswordData}) async {
    final response = await _client.post('/auth/reset-password/email', data: resetPasswordData.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }

  Future<Result<bool>> verifyCode({required EnterModel enterData}) async {
    final response = await _client.post('/auth/reset-password/verify', data: enterData.toJson());
    return response.fold((error) => Result.error(error), (value) =>Result.ok(value as bool));
  }

  Future<Result<String>> resetPassword({required ResetModel resetData}) async {
    final response = await _client.post('/auth/reset-password/reset', data: resetData.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok("Parol muvaffaqiyatli o‘zgartirildi"));
  }
}
