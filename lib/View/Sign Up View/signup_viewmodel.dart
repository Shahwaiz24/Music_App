// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Services/api.dart';
import 'package:music_app/View/Sign%20Up%20View/signup_view.dart';
import 'package:music_app/http_model/http_model.dart';

class SignUpViewModel with ChangeNotifier {
  bool isHide = true;
  String? errorMsg;
  String successMsg = 'Successfuly SignUp';
  bool successResponse = false;
  bool isSignUpLoading = false;
  bool failureResponse = false;

  enableHiding() {
    isHide = !isHide;
    notifyListeners();
  }

  onchanger() {
    failureResponse = false;
    notifyListeners();
  }

  signup({required UserSignUpModel body}) async {
    isSignUpLoading = true;
    failureResponse = false;
    notifyListeners();

    if ((body.email == null || body.email.isEmpty) ||
        (body.password == null || body.password.isEmpty) ||
        (body.fullname == null || body.fullname.isEmpty)) {
      isSignUpLoading = false;
      failureResponse = true;
      errorMsg = 'Fill Given Fields';
      notifyListeners();
    } else {
      try {
        final Map<String, dynamic> response =
            await ApiService.signUp(body: body);
        if (response['status'] == 'Success') {
          isSignUpLoading = false;
          bool successResponse = true;

          signUpEmailController.clear();
          signUpPasswordController.clear();
          signUpNameController.clear();
          notifyListeners();
          print(
              "Status: ${response['status']} | UserData: ${response['user']}");
        } else {
          errorMsg = 'Email Already Exist';
          isSignUpLoading = false;
          failureResponse = true;
          signUpEmailController.clear();
          signUpPasswordController.clear();
          signUpNameController.clear();
          notifyListeners();
          print(
              "Status: ${response['status']} | UserData: ${response['error']}");
        }
      } catch (e) {
        print("Error: ${e}");
        failureResponse = true;
        isSignUpLoading = false;
        signUpEmailController.clear();
        signUpPasswordController.clear();
        signUpNameController.clear();
        errorMsg = "An Error Occured";
        notifyListeners();
      }
    }
  }
}
