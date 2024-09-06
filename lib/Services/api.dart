import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/Services/global_data.dart';
import 'package:music_app/http_model/http_model.dart';

String mainUrl = "https://music-app-back-end.vercel.app/v1/api/";
String spotifyUrl = 'https://api.spotify.com/v1/artists/';

class ApiService {
  static getToken() async {
    try {
      final url = "${mainUrl}getToken";
      final clientUrl = Uri.parse(url);
      var response = await http.get(clientUrl);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        GlobalData.accessToken = responseData['token'][0]['token'];
        print("Token : ${GlobalData.accessToken}");
      }
    } catch (e) {
      print('Error Fetching Token ${e}');
    }
  }

  static updateToken({required String body}) async {
    try {
      final url = "${mainUrl}updateToken";
      final clientUrl = Uri.parse(url);

      final requestBody = json.encode({'token': body});

      var response = await http.post(
        clientUrl,
        body: requestBody,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        GlobalData.accessToken = responseData['token'][0]['token'];
        print("Token : ${GlobalData.accessToken}");
      } else {
        print('Failed to update token: ${response.statusCode}');
      }
    } catch (e) {
      print('Error Fetching Token: ${e}');
    }
  }

  static getArtistTracks({required String selectedId}) async {
    try {
      final url = "${spotifyUrl}${selectedId}/top-tracks";
      final clientUrl = Uri.parse(url);
      var response = await http.get(
        clientUrl,
        headers: {
          'Authorization': 'Bearer ${GlobalData.accessToken}',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final track = data["tracks"] as List;
        GlobalData.artistTracks.clear();
        for (var i = 0; i < data['tracks'].length; i++) {
          GlobalData.artistTracks.add({
            'Track Name': track[i]['name'], // Track name
            'Artist Name': track[i]['artists'][0]['name'], // Artist name
            'Url': track[i]['preview_url'], // Preview URL for audio
            'Popularity': track[i]['popularity'], // Popularity
            'Image': track[i]['album']['images'][0]['url'], // Album image
          });
        }
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      print('Error While fetching Artist Track ${e}');
      return e;
    }
  }

  static getArtistId() async {
    try {
      final url = "${mainUrl}getArtist";
      final clientUrl = Uri.parse(url);
      var response = await http
          .get(clientUrl, headers: {"Content-Type": "application/json"});
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        GlobalData.artistId.clear();
        for (var i = 0; i < responseData["artist"].length; i++) {
          GlobalData.artistId
              .add(responseData["artist"][i]["artist_id"].toString());
        }

        print('Successfuly Added | The List ${GlobalData.artistId}');
      }
    } catch (e) {
      print('Getting Artist Error ${e}');
      GlobalData.artistId = [];
    }
  }

  static login({
    required UserloginModel body,
  }) async {
    try {
      final url = "${mainUrl}login";
      final clientUrl = Uri.parse(url);
      final bodyJson = jsonEncode(body.toJson());
      var response = await http.post(
        clientUrl,
        body: bodyJson,
        headers: {"Content-Type": "application/json"},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        return {
          "status": responseData["status"],
          "user": responseData["response"][0],
        };
      } else {
        return {
          "status": responseData["status"],
          "error": responseData["response"],
        };
      }
    } on Exception catch (e) {
      print("Api Erorr: ${e}");
      // TODO
    }
  }

  static signUp({
    required UserSignUpModel body,
  }) async {
    try {
      final url = "${mainUrl}signup";
      final clientUrl = Uri.parse(url);
      final bodyJson = jsonEncode(body.toJson());
      var response = await http.post(
        clientUrl,
        body: bodyJson,
        headers: {"Content-Type": "application/json"},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        return {
          "status": responseData["status"],
          "user": responseData["user"][0],
        };
      } else {
        return {
          "status": responseData["status"],
          "error": responseData["response"],
        };
      }
    } catch (e) {}
  }

  static getArtists() async {
    try {
      List<String> artistIds = GlobalData.artistId;

      // Remove any URL encoding
      // Join the list of artist IDs into a comma-separated string
      String artistIdsString = artistIds.join(',');
      print("Artist id : ${GlobalData.artistId}");

      // Remove any URL encoding
      artistIdsString = Uri.decodeComponent(artistIdsString);
      final url = Uri.parse('${spotifyUrl}?ids=$artistIdsString');
      print("Url ${url}");
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${GlobalData.accessToken}',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Process the artist data
        List<dynamic> artists = responseData['artists'];
        GlobalData.artist.clear();
        for (var artist in artists) {
          Map<String, dynamic> artistData = {
            'Artist Name': artist['name'].toString(),
            'Popularity': artist['popularity'].toString(),
            'Followers': artist['followers']['total'].toString(),
            'Profile Pic': artist['images'][0]['url'].toString(),
            'Spotify URL': artist['external_urls']['spotify'].toString(),
          };
          GlobalData.artist.add(artistData);
        }
        return response.statusCode;
      }
      return response.statusCode;
    } catch (e) {
      print('Error fetching artists: $e');
      return e;
    }
  }

  static refreshToken() async {
    final url = 'https://accounts.spotify.com/api/token';
    final clientUrl = Uri.parse(url);
    var response = await http.post(clientUrl, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':
          'Basic YmY5MThjNGQ3MDQ4NDA5Nzg1YzgxYmExMTk0YjI3Njk6ZjQwYzk1MTQ1ZDNmNDlkN2JiNGQ2NzZhNTY0MjI3YmY='
    }, body: {
      'grant_type': 'refresh_token',
      'refresh_token':
          'AQA3GEQS7rd_gXIyRx4o9aQIG8lLn3SD_x8EuPNk9GpJQA_jgN3xr08TR2ipH4KG7UK8bLRj85zdBnyRLYgC68tqdSy0TJrnnCmhGE0doXzf6XoiRSUm89tH7yPV4kd63o8'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newAccessToken = data['access_token'].toString();
      GlobalData.accessToken = newAccessToken;
      // Handle the new access token (e.g., save it to secure storage)
      print('New access token: $newAccessToken');
    } else {
      print('Failed to refresh token: ${response.body}');
    }
  }
}
