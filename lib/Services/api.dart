import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/http_model/http_model.dart';

String mainUrl = "https://music-app-back-end.vercel.app/v1/api/";

class ApiService {
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
  static signUp  ({
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

if(response.statusCode == 200){
return {
          "status": responseData["status"],
          "user": responseData["user"][0],
        };
}
else{
  return {
          "status": responseData["status"],
          "error": responseData["response"],
        };
}

    } catch (e) {
      
    }
  }
}
