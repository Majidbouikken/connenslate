import 'package:flutter/material.dart';
import 'package:htn2021_project/pages/widgets/widgets.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Spacer(),
              /// todo: replace with a logo
              Image(
                image: AssetImage('assets/img/greenlogo.png'),
                height: 120,
                width: 120,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "CONNENSLATE",
                style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "Because everyone deserves to be heard.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Spacer(),
              Button(
                title: 'GET STARTED',
                style: ButtonStyles.PRIMARY,
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding');
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              Button(
                title: 'I ALREADY HAVE AN ACCOUNT',
                style: ButtonStyles.SECONDARY,
                onPressed: () {
                  Navigator.pushNamed(context, '/login_screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}