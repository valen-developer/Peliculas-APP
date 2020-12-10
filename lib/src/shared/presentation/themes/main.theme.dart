import 'package:flutter/material.dart';

const backgroundColor = Color(0xff1F2340);

const primaryTextColor = Color(0xffffffff);

final mainTheme = new ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  backgroundColor: backgroundColor,
  cardColor: Color(0xff12172E),
  primaryColor: Color(0xff3DA2E2),
  iconTheme: IconThemeData(color: primaryTextColor, size: 35, opacity: 1),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: primaryTextColor,
      fontSize: 17,
    ),
    headline1: TextStyle(
      fontSize: 25,
      color: primaryTextColor,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 24,
      color: primaryTextColor,
      fontWeight: FontWeight.w800
    ),
    overline: TextStyle(
      fontSize: 15,
      color: primaryTextColor,
    ),
  ),
);