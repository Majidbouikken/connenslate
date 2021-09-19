import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htn2021_project/domain/values.dart';
import 'package:htn2021_project/pages/widgets/language_selector.dart';

class InterpreterPage2 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const InterpreterPage2({Key key, this.onChanged}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<InterpreterPage2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            "I can communicate with someone who's...",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 8.0,
          ),
          DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  border: Border.all(
                    width: 3,
                    color: Theme.of(context).dividerColor,
                    style: BorderStyle.solid,
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Container(
                height: 56,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        FontAwesomeIcons.search,
                        size: 24,
                        color: Theme.of(context).unselectedWidgetColor,
                      ),
                    ),
                    Text('Search', style: Theme.of(context).textTheme.headline6,)
                  ],
                ),
              )),
          SizedBox(
            height: 16,
          ),
          LanguageSelector(
            list: languages,
          ),
        ]),
      ),
    );
  }
}
