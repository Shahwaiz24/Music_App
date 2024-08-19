import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

class LocalStorage {
  static initialization() async {
    prefs = await SharedPreferences.getInstance();
    print('Initialized');
  }

  static onBoarding() async {
   await prefs.setBool('onBoarding Save', true);
  }
    static bool? getOnBoardingStatus() {
    return prefs.getBool('onBoardingSave');
  }
}
