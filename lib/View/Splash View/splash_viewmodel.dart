import 'package:flutter/material.dart';
import 'package:music_app/Services/api.dart';
import 'package:music_app/Services/local_Storage.dart';
import 'package:music_app/View/Get%20In%20View/getin_view.dart';
import 'package:music_app/View/Home%20View/home_view.dart';
import 'package:music_app/View/On%20Boarding%20View/onboarding_view.dart';

class SplashViewmodel with ChangeNotifier {
  static gettingArtistandToken() async {
    await ApiService.getToken();
    await ApiService.getArtistId();
  }

  static Future<bool> getOnBoardingStatus() async {
    try {
      bool onboardingStatus = await LocalStorage.getOnBoardingStatus();
      return onboardingStatus;
    } catch (e) {
      print("Error retrieving onboarding status: $e");
      return false;
    }
  }

  static checkOnBoardingStatus({required BuildContext context}) async {
    try {
      // Await the asynchronous method
      await Future.delayed(const Duration(seconds: 2));
      bool status = await SplashViewmodel.getOnBoardingStatus();
      bool loginstatus = await LocalStorage.getLoginStatus();
      if (status == true && loginstatus == true) {
        print("Next Home");
        await SplashViewmodel.gettingArtistandToken();

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeView()));
      } else if (status == true && loginstatus == false) {
        print("Next Get In");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const GetinView()));
      } else {
        print("Next On Boarding");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingView()));
      }
    } catch (e) {
      print("Error checking onboarding status: $e");
    }
  }
}
