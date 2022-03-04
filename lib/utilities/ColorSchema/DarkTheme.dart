import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/utilities/ColorSchema/index.dart';

ThemeData DarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorSchema.mulledWine,
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 36.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: Colors.transparent),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 36.0,
      // fontStyle: FontStyle.italic,
      fontFamily: 'Hind',
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontFamily: 'Hind',
    ),
  ),
);
