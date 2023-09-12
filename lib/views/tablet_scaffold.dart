import 'package:flutter/material.dart';
import 'package:responsive_ui/constants/constant.dart';
import 'package:responsive_ui/widget/todo_box.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
