import 'package:ecommerce_app/data/models/auth_model/login_model.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepo;

  LoginViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;
  bool isLoginLoading = false;
  String? loginError;
  bool isSuccess = false;

  Future<bool> login({required LoginModel loginData}) async {
    isLoginLoading = true;
    notifyListeners();
    var result = await _authRepo.login(loginData: loginData);
    return result.fold(
      (error) {
        loginError = error.toString();
        isLoginLoading = false;
        notifyListeners();

        return false;
      },
      (value) {
        isSuccess = true;
        isLoginLoading = false;
        notifyListeners();

        return true;
      },
    );
  }
}
// blocListener