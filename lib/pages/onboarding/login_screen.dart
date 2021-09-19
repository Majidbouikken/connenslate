import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htn2021_project/pages/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              returnFunction: () {Navigator.pop(context);},
            ),
            Spacer(),

            /// todo: replace with a logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  EditText(
                    labelText: 'Email',
                    hintText: 'example@email.com',
                    icon: FontAwesomeIcons.userAlt,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  EditText(
                    labelText: 'Password',
                    hintText: 'Your password here',
                    obscureText: true,
                    icon: FontAwesomeIcons.lock,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Button(
                title: 'LOGIN',
                style: ButtonStyles.PRIMARY,
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
