import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/utilities/ColorSchema/index.dart';

enum Themes { lightTheme, darkTheme }

class ThemeProvider extends ChangeNotifier {
  Themes activeTheme = Themes.lightTheme;
  // bool get lightTheme => _lightTheme;

  bool get isLightTheme => activeTheme == Themes.lightTheme;
  bool get isDarkTheme => activeTheme == Themes.darkTheme;

  set setTheme(Themes theme) {
    switch (theme) {
      case Themes.lightTheme:
        activeTheme = Themes.lightTheme;
        break;
      case Themes.darkTheme:
        activeTheme = Themes.darkTheme;
        break;
      default:
        activeTheme = Themes.lightTheme;
        break;
    }
    notifyListeners();
  }

  ThemeData get lightThemeData => ThemeData(
        primaryColor: ColorSchema.azure,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 36.0,
            color: ColorSchema.mulledWine,
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

  ThemeData get darkThemeData => ThemeData(
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
}
