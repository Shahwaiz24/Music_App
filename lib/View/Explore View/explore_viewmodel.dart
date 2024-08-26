import 'package:flutter/material.dart';
import 'package:music_app/Services/api.dart';

class ExploreViewModel with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;

  fetchingArtist() async {
    try {
      isLoading = true;
      notifyListeners();
      await ApiService.getArtists();
      await Future.delayed(Duration(seconds: 1));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error Token');
      isError = true;
      notifyListeners();
    }
  }
}
