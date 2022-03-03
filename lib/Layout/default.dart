import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/ThemeProvider/index.dart';

@immutable
class DefaultLayout extends StatelessWidget {
  final Widget child;
  const DefaultLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Gradient gradient;

    final LinearGradient _lightGradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [Colors.grey.shade50, Colors.blueAccent],
    );
    final LinearGradient _darkGradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      // stops: const <double>[0.5, 0.75, 1],
      colors: [
        const Color.fromRGBO(6, 6, 29, 1),
        Colors.blue.shade900,
        Colors.blue,
      ],
    );

    switch (Provider.of<ThemeProvider>(context).activeTheme) {
      case Themes.lightTheme:
        gradient = _lightGradient;
        break;
      case Themes.darkTheme:
        gradient = _darkGradient;
        break;
      default:
        gradient = _lightGradient;
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: gradient,
          ),
        ),
        child,
      ],
    );
  }
}
