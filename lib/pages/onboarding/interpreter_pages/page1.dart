import 'package:flutter/material.dart';
import 'package:htn2021_project/domain/values.dart';
import 'package:htn2021_project/pages/widgets/language_selector.dart';
import 'package:htn2021_project/pages/widgets/user_type_button.dart';

class InterpreterPage1 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const InterpreterPage1({Key key, this.onChanged}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<InterpreterPage1> {
  int _selectedType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            "I speak...",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 8.0,
          ),
          LanguageSelector(
            list: [
              Country('assets/flags/uk.png', 'English', null),
              Country('assets/flags/fr.png', 'Français', null),
            ],
          ),
        ]),
      ),
    );
  }
}
