import 'package:ecommerce_app/data/models/auth_me_model.dart';
import 'package:ecommerce_app/data/models/auth_update_model.dart';

import '../models/auth_model/login_model.dart';
import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/core/utils/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ecommerce_app/data/models/auth_model/sign_up_model.dart';
import 'package:ecommerce_app/data/models/auth_model/reset_password_model.dart';

abstract interface class IAuthRepository {
  Future<Result<String>> add({required SignUpModel signUpData});

  Future<Result<String>> login({required LoginModel loginData});

  Future<Result<String>> sendResetEmail({required ResetPasswordModel resetPasswordData});

  Future<Result<bool>> verifyCode({required EnterModel enterData});

  Future<Result<String>> resetPassword({required ResetModel resetData});

  Future<Result<String>> save({required int id});

  Future<Result<String>> unsave({required int id});

  Future<Result<AuthMeModel>> me();

  Future<Result<AuthUpdateModel>> update(AuthUpdateModel data);
}

class AuthRepository implements IAuthRepository {
  final ApiClient _client;
  final FlutterSecureStorage _secureStorage;

  AuthRepository({
    required FlutterSecureStorage secureStorage,
    required ApiClient client,
  }) : _client = client,
       _secureStorage = secureStorage;

  @override
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

  @override
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

  @override
  Future<Result<String>> sendResetEmail({required ResetPasswordModel resetPasswordData}) async {
    final response = await _client.post('/auth/reset-password/email', data: resetPasswordData.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }

  @override
  Future<Result<bool>> verifyCode({required EnterModel enterData}) async {
    final response = await _client.post('/auth/reset-password/verify', data: enterData.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok(value as bool));
  }

  @override
  Future<Result<String>> resetPassword({required ResetModel resetData}) async {
    final response = await _client.post('/auth/reset-password/reset', data: resetData.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok("Parol muvaffaqiyatli o‘zgartirildi"));
  }

  @override
  Future<Result<String>> save({required int id}) async {
    final response = await _client.post('/auth/save/$id', data: {});
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }

  @override
  Future<Result<String>> unsave({required int id}) async {
    final response = await _client.post('/auth/unsave/$id', data: {});
    return response.fold((error) => Result.error(error), (value) => Result.ok(value));
  }

  @override
  Future<Result<AuthMeModel>> me() async {
    final response = await _client.get('/auth/me');
    return response.fold((error) => Result.error(error), (value) => Result.ok(AuthMeModel.fromJson(value)));
  }

  @override
  Future<Result<AuthUpdateModel>> update(AuthUpdateModel data) async {
    final response = await _client.patch('/auth/update', data: data.toJson());
    return response.fold((error) => Result.error(error), (value) => Result.ok(AuthUpdateModel.fromJson(value)));
  }
}
