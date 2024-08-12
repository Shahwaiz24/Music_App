import 'package:flutter/material.dart';

class SignUpViewModel with ChangeNotifier {
  bool isHide = true;

  enableHiding() {
    isHide = !isHide;
    notifyListeners();
  }
  
}