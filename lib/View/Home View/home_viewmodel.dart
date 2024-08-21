import 'package:flutter/material.dart';
import 'package:music_app/Services/local_Storage.dart';
import 'package:music_app/Services/user_data.dart';

class HomeViewmodel with ChangeNotifier {
  bool isExplore = false;
  static getUserdata() async {
    await LocalStorage.getUserData();
  }

  getStats() async {
    if ((UserData.userdata['stats']['Continue_Listening'] == 0) &&
        (UserData.userdata['stats']['Top_Mixes'] == 0) &&
        (UserData.userdata['stats']['Based On Recent Listening'] == 0)) {
      print('Have to Explore');
      isExplore = true;
    }
  }
}
