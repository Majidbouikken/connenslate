import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_dialog.dart';

class Demand {
  String title;
  String description;
  String disableName;
  String status;

  String get getTitle => title;

  String get getDescription => title;

  String get getDisableName => title;

  String get getStatus => title;

  set setTitle(String title) {
    this.title = title;
  }
  set setDescription(String description) {
    this.description = description;
  }
  set setDisableName(String disableName) {
    this.disableName = disableName;
  }
  set setStatus(String status) {
    this.status = status;
  }

  Demand(this.title, this.description, this.disableName, this.status);

  static List<Demand> demands = [
    Demand(
        'Medical',
        "Help me with my paper work!",
        'Ali Raiah',
        'valid'),
    Demand(
        'Education',
        "Help me with my paper work!",
        'Houssem Sehdi',
        'scheduled'),
    Demand(
        'Transit',
        "Help me with my paper work!",
        'Abdelkader kattal',
        'none'),
    Demand(
        'Social',
        "Help me with my paper work!",
        'Abdou Tliling',
        'none'),
  ];
}

class ScheduledDemandBox extends StatelessWidget {
  ScheduledDemandBox({Key key, this.demand, this.onPressed}) : super(key: key);
  final Demand demand;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: () {
              showCustomDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return CustomDialog(
                              demand: this.demand,
                              buttonTitle: demand.status == "valid"
                                  ? ""
                                  : demand.status == "scheduled"
                                  ? "Cancel offer"
                                  : "Offer help!",
                              noButton: demand.status == "valid" ? true : false,
                              onPressed: onPressed,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 36, left: 16, bottom: 8, right: 16),
                                child: Column(
                                  children: [
                                    Text(
                                      'Alice Denney',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    (this.demand.status == "none")
                                        ? SizedBox()
                                        : RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Status : ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
                                        TextSpan(
                                            text: (this.demand.status == "scheduled")
                                                ? 'Waiting for a response' : 'Scheduled!',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.w600,
                                                color: (this
                                                    .demand
                                                    .status ==
                                                    "scheduled")
                                                    ? Theme.of(context)
                                                    .primaryColor
                                                    : Theme.of(context).primaryColor))
                                      ]),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                        'Help me read a book about this and that bla bla bla lorem ipsum elecf wa7ed.',
                                        textAlign: TextAlign.center,
                                        style:
                                        Theme.of(context).textTheme.subtitle2),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 96,
                                          child: Column(
                                            children: [
                                              Text(
                                                '02:30',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                                textScaleFactor: 3.0,
                                              ),
                                              Text("AM",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Container(
                                          width: 96,
                                          child: Column(
                                            children: [
                                              Text(
                                                '23rd',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                                textScaleFactor: 3.0,
                                              ),
                                              Text("December",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        });
                  });
            },
            child: Container(
              width: 140,
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
                    color: demand.status == "valid"
                        ? Theme.of(context).primaryColor
                        : demand.status == "scheduled"
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).backgroundColor,
                  )),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        demand.title,
                        style: Theme.of(context).textTheme.subtitle2,
                        textScaleFactor: 7 / 6,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '- ' + demand.disableName,
                        style: Theme.of(context).textTheme.subtitle2,
                        textScaleFactor: 5 / 6,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          demand.status == "none"
              ? SizedBox()
              : Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: demand.status == "valid"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              demand.status == "valid"
                  ? FontAwesomeIcons.check
                  : demand.status == "scheduled"
                  ? FontAwesomeIcons.solidHourglass
                  : FontAwesomeIcons.key,
              size: 12,
              color: demand.status == "valid"
                  ? Colors.white
                  : Theme.of(context).backgroundColor,
            ),
          )
        ],
      ),
    );
  }
}