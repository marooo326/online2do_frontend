import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tabletScaffold;
  final Widget desktopScaffold;
  const ResponsiveLayout({
    super.key,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1100) {
        return tabletScaffold;
      } else {
        return desktopScaffold;
      }
    });
  }
}
