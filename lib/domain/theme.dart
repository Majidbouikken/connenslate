import 'package:flutter/material.dart';

Color blueColor = Color(0xFF4ac6fe);
Color darkBlueColor = Color(0xFF1a3039);
Color lightBlueColor = Color(0xFFedf9ff);


final ThemeData darkTheme = ThemeData(

    /// brightness
    brightness: Brightness.dark,

    /// primary and accent colors
    primaryColor: Color(0xFF94d631),
    primaryColorBrightness: Brightness.dark,
    // primaryColorLight: Color(0xff9e9e9e),
    // primaryColorDark: Color(0xff000000),
    accentColor: Color(0xFF71ad26),
    accentColorBrightness: Brightness.light,

    /// body colors
    //canvasColor: background_color_2,
    backgroundColor: Color(0xFF202f37),
    scaffoldBackgroundColor: Color(0xFF141f23),
    // bottomAppBarColor: Color(0xff424242),
    cardColor: Color(0xFF202f37),
    dividerColor: Color(0xFF495661),

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
        subtitle1: TextStyle(
          color: Color(0xff8f9aa2),
          fontFamily: 'Cairo',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
            color: Color(0xffe7e7e7),
            fontFamily: 'Cairo',
            fontSize: 32,
            fontWeight: FontWeight.w400,
            height: 1.2),
        headline5: TextStyle(
            color: Color(0xffe7e7e7),
            fontFamily: 'Cairo',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.2),
        headline6: TextStyle(
            color: Color(0xff8f9aa2),
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            height: 1.2),
        bodyText1: TextStyle(
            color: Color(0xffe7e7e7),
            fontFamily: 'Cairo',
            fontSize: 14,
            height: 1.0,
            fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            color: Color(0xff8f9aa2),
            fontFamily: 'Cairo',
            fontSize: 12,
            height: 1.0,
            fontWeight: FontWeight.w400),
        button: TextStyle(
            color: Color(0xFF141f23),
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.w600)));

final ThemeData lightTheme = ThemeData(

    /// brightness
    brightness: Brightness.light,

    /// primary and accent colors
    primaryColor: Color(0xFF94d631),
    primaryColorBrightness: Brightness.light,
    // primaryColorLight: Color(0xff9e9e9e),
    // primaryColorDark: Color(0xff000000),
    accentColor: Color(0xFF71ad26),
    accentColorBrightness: Brightness.light,

    /// body colors
    //canvasColor: background_color_2,
    backgroundColor: Color(0xFFe7e7e7),
    scaffoldBackgroundColor: Color(0xFFffffff),
    // bottomAppBarColor: Color(0xff424242),
    cardColor: Color(0xFFe7e7e7),
    dividerColor: Color(0xFFdedede),

    /// interaction colors
    /// todo: complete these colors
    highlightColor: Color(0x66bcbcbc),
    splashColor: Color(0x66c8c8c8),
    selectedRowColor: Color(0xff495256),
    unselectedWidgetColor: Color(0x8a000000),
    disabledColor: Color(0x61000000),
    buttonColor: Color(0xffe0e0e0),
    secondaryHeaderColor: Color(0xffe5fffb),
    hintColor: Color(0x8a000000),
    errorColor: Color(0xffff1a42),
    textTheme: TextTheme(
        subtitle1: TextStyle(
          color: Color(0xff8f9aa2),
          fontFamily: 'Cairo',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
            color: Color(0xff333b3f),
            fontFamily: 'Cairo',
            fontSize: 32,
            fontWeight: FontWeight.w400,
            height: 1.2),
        headline5: TextStyle(
            color: Color(0xff333b3f),
            fontFamily: 'Cairo',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.2),
        headline6: TextStyle(
            color: Color(0xff485156),
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            height: 1.2),
        bodyText1: TextStyle(
            color: Color(0xff333b3f),
            fontFamily: 'Cairo',
            fontSize: 14,
            height: 1.0,
            fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            color: Color(0xff485156),
            fontFamily: 'Cairo',
            fontSize: 12,
            height: 1.0,
            fontWeight: FontWeight.w400),
        button: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.w600)));
