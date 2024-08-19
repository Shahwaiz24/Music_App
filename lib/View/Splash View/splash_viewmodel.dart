import 'package:flutter/material.dart';
import 'package:music_app/Services/local_Storage.dart';

class SplashViewmodel with ChangeNotifier {
  static  getOnBoardingStatus() async {
         bool onboardingStatus = await LocalStorage.getOnBoardingStatus();
         return onboardingStatus;

  }
}
