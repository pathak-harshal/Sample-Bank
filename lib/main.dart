import 'package:flutter/material.dart';
import 'package:sample_bank/screens/index.dart';
import 'package:sample_bank/stores/connectivity_store.dart';
import 'package:sample_bank/stores/login_store.dart';
import 'package:sample_bank/theme/app_theme.dart';
import 'package:sample_bank/utility/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final loginStore = locator<LoginStore>();
  final connectivityStore = locator<ConnectionStore>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Bank',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme, // Optional: Add a dark theme
      themeMode: ThemeMode.system, // Use system theme by default
      home: FutureBuilder<bool>(
        future: loginStore.checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            if (snapshot.data!) {
              return SendMoneyPage();
            } else {
              return LoginPage();
            }
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
