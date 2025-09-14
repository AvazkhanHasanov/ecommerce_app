import 'package:ecommerce_app/data/models/auth_model/sign_up_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/repositories/auth_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthRepository _authRepo;

  SignUpViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;
  bool isSignLoading = false;
  String? signError;
  bool isSuccess = false;

  Future<bool> signUp({required SignUpModel signData}) async {
    isSignLoading = true;
    notifyListeners();
    var result = await _authRepo.add(signUpData: signData);
    return result.fold(
      (error) {
        signError = error.toString();
        isSignLoading = false;
        notifyListeners();

        return false;
      },
      (value) {
        isSuccess = true;
        isSignLoading = false;
        notifyListeners();

        return true;
      },
    );
  }
}
