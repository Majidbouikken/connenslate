import 'package:flutter/material.dart';
import 'package:htn2021_project/domain/values.dart';
import 'package:htn2021_project/pages/widgets/language_selector.dart';
import 'package:htn2021_project/pages/widgets/user_type_button.dart';

class RefugeePage1 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const RefugeePage1({Key key, this.onChanged}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<RefugeePage1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            "I am from...",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 8.0,
          ),
          LanguageSelector(
            list: countries,
          ),
        ]),
      ),
    );
  }
}
