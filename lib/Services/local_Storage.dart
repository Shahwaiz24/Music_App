import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

class LocalStorage {
  static Future<void> initialization() async {
    prefs = await SharedPreferences.getInstance();
    print('Initialized');
  }

  static Future<void> onBoardingSave() async {
    await prefs.setBool('onBoardingSave', true);
  }

  static Future<bool> getOnBoardingStatus() async {
    bool? status = await prefs.getBool('onBoardingSave');
    return status ?? false;
  }

  static Future<void> loginSave() async {
    await prefs.setBool('LoginSave', true);
  }

  static Future<bool> getLoginStatus() async {
    bool? loginStatus = await prefs.getBool('LoginSave');
    return loginStatus ?? false;
  }
}
