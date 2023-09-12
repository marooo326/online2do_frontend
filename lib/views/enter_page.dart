import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/models/user.dart';
import 'package:responsive_ui/views/desktop_scaffold.dart';
import 'package:responsive_ui/views/responsive_layout.dart';
import 'package:responsive_ui/views/tablet_scaffold.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  final TextEditingController _controller = TextEditingController();

  bool isEnterd = false;
  String username = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isEnterd) {
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
                onPressed: () {
                  setState(() {
                    username = _controller.text;
                    isEnterd = true;
                  });
                },
                child: const Text("확인"),
              ),
            ],
          ),
        ),
      );
    } else {
      return ChangeNotifierProvider(
        create: (context) => User(username: username),
        child: const ResponsiveLayout(
          tabletScaffold: TabletScaffold(),
          desktopScaffold: DesktopScaffold(),
        ),
      );
    }
  }
}
