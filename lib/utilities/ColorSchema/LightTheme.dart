import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/utilities/ColorSchema/index.dart';

ThemeData LightTheme = ThemeData(
  primaryColor: ColorSchema.azure,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 36.0,
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: Colors.transparent),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 72.0,
      color: ColorSchema.mulledWine,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: ColorSchema.mulledWine,
    ),
    headline6: const TextStyle(
      fontSize: 36.0,
      // fontStyle: FontStyle.italic,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      color: ColorSchema.mulledWine,
    ),
  ),
);
