import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:some_food/core/data/models/user_model.dart';
import 'package:some_food/core/theme.dart';
import 'package:some_food/feature/presentation/auth/pages/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: const AuthPage(),
    );
  }
}

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
}
