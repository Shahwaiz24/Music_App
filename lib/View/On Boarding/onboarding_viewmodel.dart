import 'package:flutter/material.dart';
import 'package:music_app/Services/local_Storage.dart';

class OnboardingViewmodel with ChangeNotifier {
  onboardingSave() async {
    await LocalStorage.onBoardingSave();
    print('Save On Boarding');
  }
}
