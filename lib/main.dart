import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive/desktop_scaffold.dart';
import 'package:responsive_ui/responsive/mobile_scaffold.dart';
import 'package:responsive_ui/responsive/responsive_layout.dart';
import 'package:responsive_ui/responsive/tablet_scaffold.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
