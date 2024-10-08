import 'package:flutter/material.dart';
import 'package:music_app/Services/local_Storage.dart';
import 'package:music_app/Services/global_data.dart';
import 'package:music_app/View/Explore%20View/explore_view.dart';
import 'package:music_app/View/Home%20View/home_view.dart';

class HomeViewmodel with ChangeNotifier {
  bool isExplore = false;
  int selectedIndex = 0;
  static getUserdata() async {
    await LocalStorage.getUserData();
  }

  stateSetter() {
    notifyListeners();
  }

  ontap({required index, required BuildContext context}) {
    selectedIndex = index;
    notifyListeners();

    print(selectedIndex);

    switch (selectedIndex) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
        print('Case 1');

        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ExploreView()),
        );
        print('Case 2');

        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
        print('Case 3');
        break;
    }
  }

  getStats() async {
    if ((GlobalData.userdata['stats']['Continue_Listening'] == 0) &&
        (GlobalData.userdata['stats']['Top_Mixes'] == 0) &&
        (GlobalData.userdata['stats']['Based On Recent Listening'] == 0)) {
      print('Have to Explore');
      isExplore = true;
    }
  }
}
