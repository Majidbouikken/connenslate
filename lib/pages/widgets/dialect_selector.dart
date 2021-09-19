import 'package:flutter/material.dart';
import 'package:htn2021_project/domain/theme.dart';
import 'package:htn2021_project/domain/values.dart';

class DialectSelector extends StatefulWidget {
  final List<Country> list;

  const DialectSelector({Key key, this.list}) : super(key: key);

  @override
  _DialectSelectorState createState() => _DialectSelectorState();
}

class _DialectSelectorState extends State<DialectSelector> {
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
      children: [
        Stack(
          children: [
            Image(
              image: AssetImage('assets/img/dzmap.png'),
              width: 180,
              height: 180,
            ),
            if (selected[1] == true)
              Image(
                image: AssetImage('assets/img/kabyle.png'),
                width: 180,
                height: 180,
              ),
            if (selected[2] == true)
              Image(
                image: AssetImage('assets/img/chaoui.png'),
                width: 180,
                height: 180,
              ),
            if (selected[3] == true)
              Image(
                image: AssetImage('assets/img/mzabi.png'),
                width: 180,
                height: 180,
              ),
            SizedBox(
              height: 32.0,
            )
          ],
        ),
        ..._buildCountries(context, widget.list)
      ],
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
                  color: (selected[i] == true)
                      ? blueColor
                      : Theme.of(context).dividerColor,
                  style: BorderStyle.solid,
                ),
                color: (selected[i] == true)
                    ? (Theme.of(context).brightness == Brightness.light)
                        ? lightBlueColor
                        : darkBlueColor
                    : Theme.of(context).scaffoldBackgroundColor),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                      (list[i].languages == null)
                          ? SizedBox()
                          : Text(
                              (() {
                                if (list[i].languages == null) return '';
                                String text = '';
                                for (int j = 0;
                                    j < list[i].languages.length;
                                    j++) text += '${list[i].languages[j]} / ';
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
