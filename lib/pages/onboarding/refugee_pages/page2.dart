import 'package:flutter/material.dart';
import 'package:htn2021_project/domain/values.dart';
import 'package:htn2021_project/pages/widgets/dialect_selector.dart';
import 'package:htn2021_project/pages/widgets/language_selector.dart';
import 'package:htn2021_project/pages/widgets/user_type_button.dart';

class RefugeePage2 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const RefugeePage2({Key key, this.onChanged}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<RefugeePage2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            "I speak...",
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            "أنا أتحدث...",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 8.0,
          ),
          DialectSelector(
            list: dialects,
          ),
        ]),
      ),
    );
  }
}
