import 'package:flutter/material.dart';
import 'package:sample_bank/screens/index.dart';
import 'package:sample_bank/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Bank',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme, // Optional: Add a dark theme
      themeMode: ThemeMode.system, // Use system theme by default
      home: LoginPage(),
    );
  }
}
