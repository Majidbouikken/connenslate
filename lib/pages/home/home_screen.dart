import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htn2021_project/pages/home/settings.dart';
import 'package:htn2021_project/pages/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final int type;

  const HomeScreen({Key key, this.type}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<String> ads = [
    'assets/img/ad1.jpg',
    'assets/img/ad2.jpg',
  ];
  final double slideMax = 225.0;
  AnimationController _drawerAnimation, _tipAnimation;
  Animation _tipRotateAnimation;
  int onLeftDrawer;
  var i = 0;

  @override
  void initState() {
    super.initState();
    onLeftDrawer = -1;
    _drawerAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _tipAnimation = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1200),
        reverseDuration: Duration.zero)
      ..addListener(() {
        setState(() {});
      });
    _tipRotateAnimation =
        new CurvedAnimation(parent: _tipAnimation, curve: Curves.linear)
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              _tipAnimation.reverse();
              setState(() {
                i = (i + 1) % ads.length;
              });
            }
          });
    Timer.periodic(Duration(seconds: 6), (timer) => {_tipAnimation.forward()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: AnimatedBuilder(
      animation: _drawerAnimation,
      builder: (context, child) {
        double _maxSlide = MediaQuery.of(context).size.width - 74,
            _slide = _drawerAnimation.value * _maxSlide;
        return Stack(
          children: [
            // home page here!
            Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                transform: Matrix4.identity()..translate(_slide * onLeftDrawer),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  SizedBox(
                    height: 108,
                  ),
                  if (widget.type == 0) // first section
                    ...[
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(16.0),
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Theme.of(context).backgroundColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You used 41 min of your time today',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color:
                                            Theme.of(context).selectedRowColor),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    height: 16,
                                    width: MediaQuery.of(context).size.width -
                                        64.0,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    height: 16,
                                    width: (MediaQuery.of(context).size.width -
                                            64.0) *
                                        (2 / 6),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '1 min',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Spacer(),
                                  Text(
                                    '60 min',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // second section
                    Column(children: [
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            'View plan',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 16.0,
                            color: Theme.of(context).disabledColor,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Are you in need of\nan interpreter?',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ] else if (widget.type == 1)
                    ...[
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 16),
                              Text(
                                'Scheduled demands',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Spacer()
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 108,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  physics: BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: _demandList(),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 48,
                                    height: 108,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            colors: [
                                              Theme.of(context).scaffoldBackgroundColor,
                                              Theme.of(context)
                                                  .scaffoldBackgroundColor
                                                  .withOpacity(0.0)
                                            ])),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  Spacer(),
                  Row(children: [
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Button(
                        title: 'CONNECT NOW',
                        style: ButtonStyles.PRIMARY,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Button(
                        title: 'SCHEDULE',
                        style: ButtonStyles.SECONDARY,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                  ]),
                  SizedBox(
                    height: 16,
                  ),
                  // ads
                  ClipRRect(
                    child: AnimatedBuilder(
                      animation: _tipRotateAnimation,
                      builder: (context, _) {
                        double width = MediaQuery.of(context).size.width;
                        double angleFace =
                            -pi / 2 * (1 - _tipRotateAnimation.value);
                        double angleSide = pi / 2 * (_tipRotateAnimation.value);
                        return Stack(
                          children: [
                            Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.003)
                                  ..rotateX(angleFace),
                                alignment: Alignment.topCenter,
                                child: Stack(
                                  children: [
                                    _tipsRender()[(i + 1) % ads.length],
                                    Container(
                                      color: Colors.white.withOpacity(
                                          (1 - _tipRotateAnimation.value) *
                                              2 /
                                              3),
                                      height: 106,
                                      width: width,
                                    ),
                                  ],
                                )),
                            Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.003)
                                  ..rotateX(angleSide),
                                alignment: Alignment.bottomCenter,
                                child: Stack(
                                  children: [
                                    _tipsRender()[i],
                                    Container(
                                      color: Colors.black.withOpacity(
                                          (_tipRotateAnimation.value) * 2 / 3),
                                      height: 106,
                                      width: width,
                                    ),
                                  ],
                                )),
                          ],
                        );
                      },
                    ),
                  )
                ])),
            // blur
            (_drawerAnimation.value != 0.0)
                ? GestureDetector(
                    onTap: () => _drawerAnimation.reverse(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(_drawerAnimation.value * 2 / 3),
                    ),
                  )
                : SizedBox(),
            // leftDrawer
            Transform(
                transform: Matrix4.identity()
                  ..translate(-MediaQuery.of(context).size.width +
                      74 +
                      _slide * onLeftDrawer),
                child:
                    (_drawerAnimation.value != 0.0) ? Settings() : SizedBox()),
            // rightDrawer
            Transform(
              transform: Matrix4.identity()
                ..translate(
                    MediaQuery.of(context).size.width + _slide * onLeftDrawer),
              child: (_drawerAnimation.value != 0.0) ? Container() : SizedBox(),
            ),
            // App bar
            Container(
              transform: Matrix4.identity()..translate(_slide * onLeftDrawer),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onLeftDrawer = 1;
                      });
                      _drawerAnimation.forward();
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        FontAwesomeIcons.userCircle,
                        size: 26,
                        color: Theme.of(context).selectedRowColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('assets/img/greenlogo.png'),
                    height: 80,
                    width: 80,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onLeftDrawer = -1;
                      });
                      _drawerAnimation.forward();
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        FontAwesomeIcons.bell,
                        size: 26,
                        color: Theme.of(context).selectedRowColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    )));
  }

  // this method creates the list of the demands
  List<Widget> _demandList() {
    List<Widget> _list = <Widget>[];
    _list.add(
      SizedBox(
        width: 24,
      ),
    );
    for (int i = 0; i < Demand.demands.length; i++) {
      _list.add(
        ScheduledDemandBox(
          demand: Demand.demands[i],
          onPressed: () {
            if (Demand.demands[i].getStatus == "none")
              setState(() {
                Demand.demands[i].setStatus = "scheduled";
              });
            if (Demand.demands[i].getStatus == "scheduled")
              setState(() {
                Demand.demands[i].setStatus = "none";
              });
            Navigator.pop(context);
          },
        ),
      );
    }
    _list.add(
      SizedBox(
        width: 60,
      ),
    );
    return _list;
  }

  List<Widget> _tipsRender() {
    List<Widget> _ads = <Widget>[];
    ads.forEach((ad) {
      _ads.add(Container(
        height: 106,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ad), fit: BoxFit.cover)),
      ));
    });
    return _ads;
  }
}
