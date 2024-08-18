import 'package:flutter/material.dart';
import 'package:music_app/Services/api.dart';

class SignUpViewModel with ChangeNotifier {
  bool isHide = true;

  enableHiding() {
    isHide = !isHide;
    notifyListeners();
  }



  
}
