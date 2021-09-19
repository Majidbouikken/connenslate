import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htn2021_project/domain/values.dart';
import 'package:htn2021_project/pages/widgets/edit_text.dart';
import 'package:htn2021_project/pages/widgets/language_selector.dart';

class InterpreterPage3 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const InterpreterPage3({Key key, this.onChanged}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<InterpreterPage3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            "Basic details about me",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 16.0,
          ),
          EditText(
            labelText: 'Name',
            hintText: 'Your name here',
            icon: FontAwesomeIcons.user,
            onChanged: (value) {},
          ),
          SizedBox(
            height: 16,
          ),
          EditText(
            savedText: 'majid@bouikken.com',
            labelText: 'Email address',
            hintText: 'email@address.com',
            textInputType: TextInputType.emailAddress,
            icon: FontAwesomeIcons.envelope,
            onChanged: (value) {},
          ),
          SizedBox(
            height: 16,
          ),
          EditText(
            savedText: '(415)555-2671',
            labelText: 'Phone number',
            hintText: '(415)555-2671',
            textInputType: TextInputType.phone,
            icon: FontAwesomeIcons.mobileAlt,
            onChanged: (value) {},
          ),
          SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
