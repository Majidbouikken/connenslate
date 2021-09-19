import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htn2021_project/domain/values.dart';
import 'package:htn2021_project/pages/widgets/edit_text.dart';
import 'package:htn2021_project/pages/widgets/language_selector.dart';

class InterpreterPage4 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const InterpreterPage4({Key key, this.onChanged}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<InterpreterPage4> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text(
                "More details",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "These info help us connect you with better matches",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 16.0,
              ),
              EditText(
                savedText: '08-07-1999',
                labelText: 'Birthdate',
                hintText: 'dd-mm-yyyy',
                textInputType: TextInputType.datetime,
                icon: FontAwesomeIcons.calendar,
                onChanged: (value) {},
              ),
              SizedBox(
                height: 16,
              ),
              EditText(
                savedText: 'Male (he/him)',
                labelText: 'Gender',
                hintText: 'your gender',
                icon: FontAwesomeIcons.transgender,
                onChanged: (value) {},
              ),
            ]),
          ),
          Divider(
            height: 0,
            thickness: 2.0,
            color: Theme.of(context).backgroundColor,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text(
                "Where you are in Canada? 🇨🇦",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Theme.of(context).selectedRowColor),
              ),
              SizedBox(
                height: 16,
              ),
              EditText(
                savedText: 'Ontario',
                labelText: 'Province',
                hintText: 'ex. Ontario',
                onChanged: (value) {},
              ),
              SizedBox(
                height: 16,
              ),
              EditText(
                savedText: 'Waterloo',
                labelText: 'City',
                hintText: 'ex. Waterloo',
                onChanged: (value) {},
              ),
              SizedBox(
                height: 16,
              ),
              EditText(
                savedText: '4 years',
                labelText: 'How long have you been in Canada?',
                hintText: 'months',
                textInputType: TextInputType.number,
                onChanged: (value) {},
              ),
              SizedBox(
                height: 16,
              ),
            ]),
          ),
        ],
      )
    );
  }
}
