import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htn2021_project/domain/values.dart';
import 'package:htn2021_project/pages/widgets/edit_text.dart';
import 'package:htn2021_project/pages/widgets/language_selector.dart';
import 'package:htn2021_project/pages/widgets/widgets.dart';

class InterpreterPage6 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const InterpreterPage6({Key key, this.onChanged}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<InterpreterPage6> {
  List<bool> selects = [false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            "I prefer to help with...",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 16),
          UserTypeButton(
            selected: selects[0],
            assetImage: 'assets/img/video-call.png',
            onPressed: () {
              setState(() {
                selects[0] = !selects[0];
              });
            },
            leadText: 'Video calls',
          ),
          SizedBox(height: 16),
          UserTypeButton(
            selected: selects[1],
            assetImage: 'assets/img/phone-call.png',
            onPressed: () {
              setState(() {
                selects[1] = !selects[1];
              });
            },
            leadText: 'Phone calls',
          ),
        ]),
      ),
    );
  }
}
