import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/http_model/http_model.dart';

String mainUrl = "https://music-app-back-end.vercel.app/v1/api/";

class ApiService {
  static login({
    required UserloginModel body,
  }) async {
    final url = "${mainUrl}login";
    final clientUrl = Uri.parse(url);
    final bodyJson =  jsonEncode(body);
    var response = await http.post(
      clientUrl,
      body: bodyJson,
      headers: {"Content-Type": "application/json"},
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return {
        "status": responseData["status"],
        "user": responseData["response"][0], // Yeh first user object ko return kar raha hai
      };
    } else {
      return {
        "status": responseData["status"],
        "error": responseData["response"],
      };
    }
  }
}
