import 'package:flutter/material.dart';
import 'package:htn2021_project/pages/widgets/user_type_button.dart';

class Page1 extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const Page1({Key key, this.onChanged}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _selectedType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          "I'm using Connenslate to...",
          style: Theme.of(context).textTheme.headline4,
        ),
        Spacer(),
        UserTypeButton(
          selected: (_selectedType == 0),
          leadText: 'Get interpretation support!',
          subText: 'Translations on demand!',
          assetImage: 'assets/img/refugee.png',
          onPressed: () => setState((){
            _selectedType = 0;
            this.widget.onChanged?.call(_selectedType);
          }),
        ),
        SizedBox(
          height: 16,
        ),
        UserTypeButton(
          selected: (_selectedType == 1),
          leadText: 'Provide interpretation helps!',
          subText: 'Many people are in need of your help!',
          assetImage: 'assets/img/interpreter.png',
          onPressed: () => setState((){
            _selectedType = 1;
            this.widget.onChanged?.call(_selectedType);
          }),
        ),
        Spacer(),
      ]),
    );
  }
}
