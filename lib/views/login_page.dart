import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/models/jwt.dart';
import 'package:responsive_ui/models/user.dart';
import 'package:responsive_ui/services/login_api_service.dart';
import 'package:responsive_ui/views/responsive/desktop_scaffold.dart';
import 'package:responsive_ui/views/responsive/mobile_scaffold.dart';
import 'package:responsive_ui/views/responsive/responsive_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  User? userInfo;

  Future<void> _sendLoginRequest(String username) async {
    Jwt jwt = await LoginApiService.login(username);
    setState(() {
      userInfo = User(username: username, token: jwt);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userInfo == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "이름을 입력하세요",
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _sendLoginRequest(_controller.text),
                child: const Text("확인"),
              ),
            ],
          ),
        ),
      );
    } else {
      return ChangeNotifierProvider(
        create: (context) => userInfo,
        child: const ResponsiveLayout(
          mobileScaffold: MobileScaffold(),
          desktopScaffold: DesktopScaffold(),
        ),
      );
    }
  }
}
