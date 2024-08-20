import 'package:flutter/material.dart';
import 'package:music_app/Services/local_Storage.dart';

class HomeViewmodel with ChangeNotifier {
  static getUserdata() async {
   await LocalStorage.getUserData();
  }
}
