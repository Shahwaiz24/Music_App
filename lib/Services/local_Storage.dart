import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

class LocalStorage {
  static initialization() async {
    prefs = await SharedPreferences.getInstance();
    print('Initialized');
  }

  static onBoardingSave() async {
    await prefs.setBool('onBoardingSave', true);
  }

  static getOnBoardingStatus() async {
    bool? status = await prefs.getBool('onBoardingSave');
    if (status == true) {
      return status;
    } else {
      return false;
    }
  }
}
