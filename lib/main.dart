import 'package:fitness/pages/home_page.dart';
import 'package:fitness/pages/login_page.dart';
import 'package:fitness/pages/register_page.dart';
import 'package:fitness/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/register_page': (context) => const RegisterPage(),
        '/login_page': (context) => const LoginPage(),
        '/home_page': (context) => const HomePage(),
        '/settings_page': (context) => const SettingsPage(),
      },
    );
  }
}
