import 'package:flutter/material.dart';
import 'package:responsive_ui/constants/constant.dart';
import 'package:responsive_ui/widget/todo_box.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      body: Row(
        children: [
          //open drawer
          myDrawer,
          const Expanded(
            flex: 2,
            child: TodoBox(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
