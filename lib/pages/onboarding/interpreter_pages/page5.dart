import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htn2021_project/domain/values.dart';
import 'package:htn2021_project/pages/widgets/edit_text.dart';
import 'package:htn2021_project/pages/widgets/language_selector.dart';
import 'package:htn2021_project/pages/widgets/widgets.dart';

class InterpreterPage5 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const InterpreterPage5({Key key, this.onChanged}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<InterpreterPage5> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            "I'll be available the...",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 16),
          CalendarInfo(),
          SizedBox(height: 16),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                  "Times shown on the timezone of the location you selected before",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
        ]),
      ),
    );
  }
}
