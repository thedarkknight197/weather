import 'package:flutter/material.dart';
import 'package:weather/app.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/CityProvider/index.dart';
import 'package:weather/provider/DaySelector/index.dart';
import 'package:weather/provider/MeteoProvider/index.dart';
import 'package:weather/provider/ThemeProvider/index.dart';
import 'package:weather/provider/UnitProvider/index.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => UnitProvider()),
      ChangeNotifierProvider(create: (context) => MeteoProvider()),
      ChangeNotifierProvider(create: (context) => DaySelector()),
      ChangeNotifierProvider(create: (context) => CityProvider()),
    ],
    child: const MyApp(),
  ));
}
