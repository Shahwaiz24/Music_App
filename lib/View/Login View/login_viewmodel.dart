import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  bool isHide = true;

  enableHiding() {
    isHide = !isHide;
    notifyListeners();
  }
}
