import 'package:flutter/material.dart';
import 'package:htn2021_project/pages/onboarding/onboarding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack The North 2021 project',
      home: OnboardingScreen(),
    );
  }

}