import 'package:flutter/material.dart';
import 'package:music_app/Services/api.dart';
import 'package:music_app/Services/global_data.dart';
import 'package:music_app/View/Track%20View/track_view.dart';

class ExploreViewModel with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  bool isTrackError = false;

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
    await Future.delayed(const Duration(seconds: 1));
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

  fetchingTrack({required int index, required BuildContext context}) async {
    try {
      isError = false;
      isLoading = true;
      isTrackError = false;
      notifyListeners();
      final artistId = GlobalData.artistId[index];
      print('Artist Id : ${artistId}');
      final code = await ApiService.getArtistTracks(selectedId: artistId);
      if (code == 200) {
        isLoading = false;
        notifyListeners();
        print('List ${GlobalData.artistTracks}');
        String artist = '';
        String artist_Pic = '';
        var artist_genres = [];
        for (var i = 0; i < GlobalData.artist.length; i++) {
          if (artistId.toString() == GlobalData.artist[i]['Artist Id']) {
            artist = GlobalData.artist[i]['Artist Name'];
            artist_Pic = GlobalData.artist[i]['Profile Pic'];
            artist_genres = GlobalData.artist[i]['Genres'];
            // print('Artist Name : ${artist}');
            // print('Artist Pic : ${artist_Pic}');

            break;
          }
        }

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TrackView(
                      artist_Name: artist,
                      artist_Pic: artist_Pic,
                      artist_genres : artist_genres,
                    )));
      } else {
        isLoading = false;
        print('Error Getting Tracks');
        print('Error ${code}');
        isError = true;
        isTrackError = true;
        notifyListeners();
      }
    } catch (e) {
      print('Error Getting Tracks ${e}');
      isLoading = false;
      isError = true;
      isTrackError = true;
      notifyListeners();
    }
  }
}
