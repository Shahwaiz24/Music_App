import 'package:flutter/material.dart';
import 'package:music_app/Services/api.dart';
import 'package:music_app/Services/global_data.dart';

class ExploreViewModel with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;

  fetchingArtist() async {
    isError = false;
    isLoading = true;
    // notifyListeners();
    int code = await ApiService.getArtists();
    print('Code ${code}');
    if (code == 200) {
      // await Future.delayed(Duration(seconds: 1))
      isLoading = false;
      // notifyListeners();
    } else {
      isLoading = false;
      print('Error Token');
      isError = true;
      // notifyListeners();
    }
  }

  refreshToken() async {
    isError = false;
    isLoading = true;
    notifyListeners();
    await ApiService.refreshToken();
    await ApiService.updateToken(body: GlobalData.accessToken);
    await Future.delayed(Duration(seconds: 1));
    int code = await ApiService.getArtists();
    if (code == 200) {
      await Future.delayed(const Duration(seconds: 1));
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      print('Error Refreshing and Getting Artists Token');
      isError = true;
      notifyListeners();
    }
  }
}
