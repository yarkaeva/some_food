import 'package:flutter/material.dart';
import 'package:some_food/core/theme.dart';
import 'package:some_food/feature/presentation/pages/bottom_bar_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: const BottomBarPage(),
    );
  }
}
