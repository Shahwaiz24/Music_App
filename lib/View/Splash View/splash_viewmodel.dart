import 'package:flutter/material.dart';
import 'package:music_app/Services/local_Storage.dart';

class SplashViewmodel with ChangeNotifier {
 static Future<bool?> getOnBoardingStatus() async {
    bool? onboardingstatus = LocalStorage.getOnBoardingStatus();
    if (onboardingstatus == true) {
      return onboardingstatus;
    } else {
      return false;
    }
  }
}
