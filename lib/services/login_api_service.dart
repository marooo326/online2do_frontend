import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:responsive_ui/constants/config.dart';
import 'package:responsive_ui/models/jwt.dart';

class LoginApiService {
  static const String apiUrl = ApiConfig.apiUrl;

  static Future<Jwt> login(String username) async {
    return await http.post(
      Uri.parse('$apiUrl/login?username="$username"'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Authorization': token,
      },
      // body: jsonEncode(<String, String>{
      //   "username": username,
      // })
      // 받아서 모델로 변환
    ).then((response) async {
      if (response.statusCode == 200) {
        final json = await jsonDecode(utf8.decode(response.bodyBytes));
        return Jwt.fromJson(json);
      } else {
        throw Exception("Failed to login");
      }
    });
  }
}
