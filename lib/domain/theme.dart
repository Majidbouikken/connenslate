import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
    /// brightness
    brightness: Brightness.dark,

    /// primary and accent colors
    primaryColor: Color(0xFF94d631),
    primaryColorBrightness: Brightness.dark,
    // primaryColorLight: Color(0xff9e9e9e),
    // primaryColorDark: Color(0xff000000),
    accentColor: Color(0xFF4ac6fe),
    accentColorBrightness: Brightness.light,

    /// body colors
    //canvasColor: background_color_2,
    backgroundColor: Color(0xFF202f37),
    scaffoldBackgroundColor: Color(0xFF141f23),
    // bottomAppBarColor: Color(0xff424242),
    cardColor: Color(0xFF202f37),
    dividerColor: Color(0xFF202f37),

    /// interaction colors
    /// todo: complete these colors
    highlightColor: Color(0x40cccccc),
    splashColor: Color(0x40cccccc),
    selectedRowColor: Color(0xfff5f5f5),
    unselectedWidgetColor: Color(0xb3ffffff),
    buttonColor: Color(0xff666666),
    secondaryHeaderColor: Color(0xff616161),
    indicatorColor: Color(0xffffc801),
    hintColor: Color(0x80ffffff),
    errorColor: Color(0xffff1a42),

    textTheme: TextTheme(
        button: TextStyle(
            color: Color(0xFF141f23),
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.w600
        )
    )
);
