import 'package:flutter/material.dart';
import 'package:htn2021_project/pages/pages.dart';
import 'domain/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack The North 2021 project',
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login_screen': (context) => LoginScreen(),
      },
      home: AuthenticationScreen(),
    );
  }
}
