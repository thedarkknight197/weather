import 'package:flutter/material.dart';
import 'package:weather/controllers/InitializeController/index.dart';
import 'package:weather/models/LoadSettingsData/index.dart';
import 'package:weather/provider/PositionProvider/index.dart';
import 'package:weather/provider/UnitProvider/index.dart';
import 'package:weather/views/Error/index.dart';
import 'package:weather/views/Home/index.dart';
import 'package:weather/views/Loading/index.dart';
import 'package:weather/views/Setting/index.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/ThemeProvider/index.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<LoadSettings> _initFuture(context) =>
      InitializeController.initialize(context);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: true);

    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: theme.isLightTheme ? theme.lightThemeData : theme.darkThemeData,
      home: FutureBuilder(
          future: _initFuture(context).then((LoadSettings value) {
            Provider.of<PositionProvider>(context, listen: false)
                .currentLocation = value.position;
            Provider.of<ThemeProvider>(context, listen: false).activeTheme =
                value.theme;
            // Provider.of<UnitProvider>(context, listen: false).currentUnit =
            //     value.unit;
          }),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return ErrorPage(message: snapshot.error.toString());
              }
              return const HomePage(title: 'Weather App');
            } else {
              return const LoadingPage();
            }
          }),
      routes: {
        '/settings': (context) => const SettingPage(),
      },
    );
  }
}
