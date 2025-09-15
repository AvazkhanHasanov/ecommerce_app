import 'package:ecommerce_app/core/utils/result.dart';
import 'package:ecommerce_app/data/models/auth_model/reset_password_model.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  final AuthRepository _authRepo;
  final FlutterSecureStorage _secureStorage;

  ResetPasswordViewModel({required AuthRepository authRepo, required FlutterSecureStorage secureStorage})
    : _authRepo = authRepo,
      _secureStorage = secureStorage;
  String? email;
  String? code;
  String? password;

  void setCode(String value) {
    code = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  bool isEnterLoading = false;
  bool isResentLoading = false;
  bool isSentToEmailLoading = false;

  String? errorEnter;
  String? errorForgot;
  String? errorReset;

  Future<void> sentToEmail({required ResetPasswordModel resetData}) async {
    isSentToEmailLoading = true;
    notifyListeners();
    var result = await _authRepo.sendResetEmail(resetPasswordData: resetData);
    result.fold(
      (error) => errorReset = error.toString(),
      (value) => Result.ok(value),
    );
    isSentToEmailLoading = false;
    notifyListeners();
  }

  Future<void> enter({required EnterModel enterData}) async {
    isEnterLoading = true;
    notifyListeners();
    var result = await _authRepo.verifyCode(enterData: enterData);
    result.fold((error) => errorEnter = error.toString(), (value) {
      if (value) {
        errorEnter = null;
      } else {
        errorEnter = 'Kod notog`ri kiritildi';
      }
    });
    isEnterLoading = false;
    notifyListeners();
  }

  Future<bool> resent({required ResetModel resetData}) async {
    isResentLoading = true;
    notifyListeners();
    var result = await _authRepo.resetPassword(resetData: resetData);
    return result.fold(
      (error) {
        errorReset = error.toString();
        isResentLoading = false;
        notifyListeners();
        return false;
      },
      (value) async {
        await _secureStorage.write(key: 'login', value: resetData.email);
        await _secureStorage.write(key: 'password', value: resetData.password);
        isResentLoading = false;
        notifyListeners();
        return true;
      },
    );
  }
}
