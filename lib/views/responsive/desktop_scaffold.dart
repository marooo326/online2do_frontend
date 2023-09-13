import 'package:flutter/material.dart';
import 'package:responsive_ui/constants/constant.dart';
import 'package:responsive_ui/widget/todo_widget.dart';

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
          Expanded(
            flex: 1,
            child: myDrawer,
          ),
          const Expanded(
            flex: 2,
            child: TodoWidget(),
          ),
          Expanded(
            flex: 1,
            child: Drawer(
              backgroundColor: Colors.lightBlue.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
