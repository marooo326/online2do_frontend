import 'package:flutter/material.dart';
import 'package:responsive_ui/models/jwt.dart';

class User with ChangeNotifier {
  String username;
  Jwt token;

  User({required this.username, required this.token});

  void changeUsername(String username) {
    this.username = username;
  }

  String getAccessToken() {
    return token.accessToken;
  }
}
