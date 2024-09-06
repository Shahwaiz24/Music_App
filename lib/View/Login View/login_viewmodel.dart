import 'package:flutter/material.dart';
import 'package:music_app/Services/api.dart';
import 'package:music_app/Services/local_Storage.dart';
import 'package:music_app/View/Home%20View/home_view.dart';
import 'package:music_app/View/Login%20View/login_view.dart';
import 'package:music_app/http_model/http_model.dart';

class LoginViewModel with ChangeNotifier {
  bool isHide = true;
  bool isLoginLoading = false;
  String successMsg = 'Successfuly Login';
  bool successResponse = false;
  bool failureResponse = false;
  String? errorMsg;

  loginSave() async {
    await LocalStorage.loginSave();
  }

  enableHiding() {
    isHide = !isHide;
    notifyListeners();
  }

  login({required UserloginModel body, required BuildContext context}) async {
    isLoginLoading = true;
    failureResponse = false;
    notifyListeners();

    if ((body.email == null || body.email.isEmpty) ||
        (body.password == null || body.password.isEmpty)) {
      isLoginLoading = false;
      failureResponse = true;
      successResponse = false;
      errorMsg = 'Fill Given Fields';
      notifyListeners();
    } else {
      try {
        final Map<String, dynamic> response =
            await ApiService.login(body: body);

        if (response['status'] == 'Success') {
          await LocalStorage.saveUserData(data: response['user']);
          failureResponse = false;
          successResponse = true;
          await loginSave();
          loginEmailController.clear();
          loginPasswordController.clear();
          notifyListeners();
          print(
              "Status: ${response['status']} | UserData: ${response['user']}");
          isLoginLoading = false;
          notifyListeners();
          await Future.delayed(const Duration(milliseconds: 1000));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeView()));
        } else {
          isLoginLoading = false;
          failureResponse = true;
          successResponse = false;
          errorMsg = "Email Not Exist";
          loginEmailController.clear();
          loginPasswordController.clear();
          notifyListeners();
          print("Status: ${response['status']} | error: ${response['error']}");
        }
      } on Exception catch (e) {
        failureResponse = true;
        isLoginLoading = false;
        successResponse = false;
        loginEmailController.clear();
        loginPasswordController.clear();
        errorMsg = "An Error Occured";
        notifyListeners();
      }
    }
  }
}
