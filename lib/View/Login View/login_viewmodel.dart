import 'package:flutter/material.dart';
import 'package:music_app/Services/api.dart';
import 'package:music_app/View/Login%20View/login_view.dart';
import 'package:music_app/http_model/http_model.dart';

class LoginViewModel with ChangeNotifier {
  bool isHide = true;
  bool isLoginLoading = false;
  bool failureResponse = false;

  enableHiding() {
    isHide = !isHide;
    notifyListeners();
  }

  login({required UserloginModel body}) async {
    try {
      isLoginLoading = true;
      failureResponse = false;
      notifyListeners();
      final Map<String, dynamic> response = await ApiService.login(body: body);

      if (response['status'] == 'Success') {
        isLoginLoading = false;
        loginEmailController.clear();
        loginPasswordController.clear();
        notifyListeners();
        print("Status: ${response['status']} | UserData: ${response['user']}");
      } else {
        isLoginLoading = false;
        failureResponse = true;

        loginEmailController.clear();
        loginPasswordController.clear();
        notifyListeners();
        print("Status: ${response['status']} | UserData: ${response['error']}");
      }
    } on Exception catch (e) {
      print("Login Erorr: ${e}");
    }
  }
}
