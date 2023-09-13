import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:responsive_ui/constants/config.dart';
import 'package:responsive_ui/models/todo.dart';

class TodoApiService {
  static const String apiUrl = ApiConfig.apiUrl;

  static Future<List<Todo>> getTodos(String accessToken) async {
    return await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': accessToken,
      },
      // 받아서 모델로 변환
    ).then((response) async {
      if (response.statusCode == 200) {
        final List<dynamic> jsonList =
            await jsonDecode(utf8.decode(response.bodyBytes));
        print(json);
        return jsonList.map((json) => Todo.fromJson(json)).toList();
      } else {
        throw Exception("Failed to login");
      }
    });
  }

  static Future<int> postTodo(String accessToken, String contents) async {
    return await http.post(
      Uri.parse('$apiUrl?contents=$contents'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': accessToken,
      },
      // 받아서 id 반환
    ).then((response) async {
      if (response.statusCode == 200) {
        final int json = await jsonDecode(utf8.decode(response.bodyBytes));
        return json;
      } else {
        throw Exception("Failed to login");
      }
    });
  }

  static void updateTodo(String accessToken, int id, bool isCompleted) async {
    await http
        .put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': accessToken,
      },
      body: jsonEncode(
        <String, dynamic>{
          "id": id,
          "state": isCompleted,
        },
      ),
    ) // 받아서 로그 출력
        .then((response) {
      print(response.body);
    });
  }
}
