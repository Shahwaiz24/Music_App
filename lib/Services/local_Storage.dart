import 'dart:convert';

import 'package:music_app/Services/global_data.dart';
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

  static saveUserData({required data}) async {
    final String jsonString = await jsonEncode(data);
    await prefs.setString('UserData', jsonString);
  }

  static getUserData() async {
    final String? jsonString = prefs.getString('UserData');
    if (jsonString != null) {
      final Map userdata =
          jsonDecode(jsonString); // Convert JSON String back to Map
      GlobalData.userdata.clear();
      GlobalData.userdata.addAll(userdata);
      print('User Data ${GlobalData.userdata}');
    } else {
      GlobalData.userdata.clear();
      print('User Data ${GlobalData.userdata}');
    }
  }
}
