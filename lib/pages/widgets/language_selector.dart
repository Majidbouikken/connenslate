import 'package:flutter/material.dart';
import 'package:htn2021_project/domain/theme.dart';
import 'package:htn2021_project/domain/values.dart';

class LanguageSelector extends StatefulWidget {
  final List<Country> list;

  const LanguageSelector({Key key, this.list}) : super(key: key);

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  List<bool> selected = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.list.length; i++) selected.add(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildCountries(context, widget.list),
    );
  }

  List<Widget> _buildCountries(BuildContext _, List<Country> list) {
    List<Widget> _list = [];
    for (int i = 0; i < list.length; i++) {
      _list.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selected[i] = !selected[i];
            });
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: (i == 0)
                    ? BorderRadius.vertical(
                        top: Radius.circular(16),
                      )
                    : (i == (list.length - 1))
                        ? BorderRadius.vertical(
                            bottom: Radius.circular(16),
                          )
                        : BorderRadius.all(
                            Radius.circular(0),
                          ),
                border: Border.all(
                  width: 3,
                  color: (selected[i] == true)? blueColor : Theme.of(context).dividerColor,
                  style: BorderStyle.solid,
                ),
                color: (selected[i] == true)? (Theme.of(context).brightness == Brightness.light)? lightBlueColor : darkBlueColor : Theme.of(context).scaffoldBackgroundColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                      image: AssetImage(list[i].flag ?? ''),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${list[i].name}',
                        style: Theme.of(_).textTheme.headline5,
                      ),
                      (list[i].languages == null)? SizedBox(): Text(
                        (() {
                          if (list[i].languages == null) return '';
                          String text = '';
                          for (int j = 0; j < list[i].languages.length; j++)
                            text += '${list[i].languages[j]} / ';
                          return text.substring(0, text.length - 2);
                        }()),
                        style: Theme.of(_).textTheme.headline6,
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    }
    return _list;
  }
}
