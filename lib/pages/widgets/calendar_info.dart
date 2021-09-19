import 'package:flutter/material.dart';
import 'package:htn2021_project/domain/theme.dart';

class CalendarButton extends StatefulWidget {
  final double size;

  CalendarButton({this.size});

  @override
  _CalendarButtonState createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        this.setState(() {
          _isSelected = !_isSelected;
        })
      },
      child: Center(
        child: Container(
          width: (this.widget.size != null) ? this.widget.size : 32,
          height: (this.widget.size != null) ? this.widget.size : 32,
          decoration: BoxDecoration(
              color:
                  _isSelected ? blueColor : Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
    //);
  }
}

/////////////

class CalendarInfo extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<CalendarInfo> {
  double _firstColumnWidth, _defaultCellWidth;

  @override
  Widget build(BuildContext context) {
    _firstColumnWidth = 64;
    _defaultCellWidth =
        (MediaQuery.of(context).size.width - 32 - _firstColumnWidth) / 7;
    return Container(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: FixedColumnWidth(_defaultCellWidth),
        columnWidths: {
          0: FixedColumnWidth(_firstColumnWidth),
        },
        children: [
          TableRow(children: [
            TableCell(child: SizedBox()),
            TableCell(
                child: Center(
                    child: Text(
              "Mon",
              style: Theme.of(context).textTheme.bodyText1,
              textScaleFactor: 1.0,
            ))),
            TableCell(
                child: Center(
                    child: Text(
              "Tue",
              style: Theme.of(context).textTheme.bodyText1,
              textScaleFactor: 1.0,
            ))),
            TableCell(
                child: Center(
                    child: Text(
              "Wed",
              style: Theme.of(context).textTheme.bodyText1,
              textScaleFactor: 1.0,
            ))),
            TableCell(
                child: Center(
                    child: Text(
              "Thu",
              style: Theme.of(context).textTheme.bodyText1,
              textScaleFactor: 1.0,
            ))),
            TableCell(
                child: Center(
                    child: Text(
              "Fri",
              style: Theme.of(context).textTheme.bodyText1,
              textScaleFactor: 1.0,
            ))),
            TableCell(
                child: Center(
                    child: Text(
              "Sat",
              style: Theme.of(context).textTheme.bodyText1,
              textScaleFactor: 1.0,
            ))),
            TableCell(
              child: Center(
                child: Text(
                  "Sun",
                  style: Theme.of(context).textTheme.bodyText1,
                  textScaleFactor: 1.0,
                ),
              ),
            )
          ]),
          TableRow(children: [
            TableCell(
                child: SizedBox(
              height: _defaultCellWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Morning",
                    style: Theme.of(context).textTheme.bodyText1,
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "06:00 - 12:00",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 9),
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
          ]),
          TableRow(children: [
            TableCell(
                child: SizedBox(
              height: _defaultCellWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Afternoon",
                    style: Theme.of(context).textTheme.bodyText1,
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "12:00 - 17:00",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 9),
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
          ]),
          TableRow(children: [
            TableCell(
                child: SizedBox(
              height: _defaultCellWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Evening",
                    style: Theme.of(context).textTheme.bodyText1,
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "17:00 - 22:00",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 9),
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
          ]),
          TableRow(children: [
            TableCell(
                child: SizedBox(
              height: _defaultCellWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Night",
                    style: Theme.of(context).textTheme.bodyText1,
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "22:00 - 06:00",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 9),
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
            TableCell(child: CalendarButton(size: _defaultCellWidth - 6)),
          ]),
        ],
      ),
    );
  }
}
