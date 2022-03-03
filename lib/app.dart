import 'package:flutter/material.dart';
import 'package:weather/controllers/InitializeController/index.dart';
import 'package:weather/provider/PositionProvider/index.dart';
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
  final Future _initFuture = InitializeController.initialize();

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<ThemeProvider>(context).activeTheme);
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).isLightTheme
          ? Provider.of<ThemeProvider>(context).lightThemeData
          : Provider.of<ThemeProvider>(context).darkThemeData,
      // home: const HomePage(title: 'Weather App'),
      home: FutureBuilder(
          future: _initFuture.then((value) =>
              Provider.of<PositionProvider>(context, listen: false)
                  .currentLocation = value),
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
