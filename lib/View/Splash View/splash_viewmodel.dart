import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/Services/api.dart';
import 'package:music_app/Services/local_Storage.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/Services/wifi_service.dart';
import 'package:music_app/View/Get%20In%20View/getin_view.dart';
import 'package:music_app/View/Home%20View/home_view.dart';
import 'package:music_app/View/On%20Boarding%20View/onboarding_view.dart';

class SplashViewmodel with ChangeNotifier {
  static gettingArtistandToken() async {
    await ApiService.getToken();
    await ApiService.getArtistId();
  }

  static void showSnackbarAndCloseApp({required BuildContext context}) async {
    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Utils.black,
        
        content: Text(
          'Wifi Not Connected',
          style: TextStyle(
            color: Utils.white,
            fontFamily: 'Mulish Bold',
            fontSize: MediaQuery.of(context).size.height * 0.020,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );

    // Wait for 2 seconds and then close the app
    await Future.delayed(Duration(seconds: 3), () {
      SystemNavigator.pop(); // Closes the app
    });
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
        
        bool wifi = await WifiService.checkWifiConnection();

        if (wifi == true) {
          await SplashViewmodel.gettingArtistandToken();
          
          print("Next Home");
             Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeView()));
        } else {
          SplashViewmodel.showSnackbarAndCloseApp(context: context);
        }
     
      } else if (status == true && loginstatus == false) {
        print("Next Get In");
         bool wifi = await WifiService.checkWifiConnection();
         if (wifi == true) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const GetinView()));
         }
         else {
          SplashViewmodel.showSnackbarAndCloseApp(context: context);
        }
       
      } else {
        print("Next On Boarding");
        bool wifi = await WifiService.checkWifiConnection();
        if (wifi == true) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const OnboardingView()));
        } else {
          SplashViewmodel.showSnackbarAndCloseApp(context: context);
        }
      }
    } catch (e) {
      print("Error checking onboarding status: $e");
    }
  }
}
