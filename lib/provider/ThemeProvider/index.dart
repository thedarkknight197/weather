import 'package:flutter/material.dart';
import 'package:weather/utilities/ColorSchema/DarkTheme.dart';
import 'package:weather/utilities/ColorSchema/LightTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/types/Themes/index.dart';

class ThemeProvider extends ChangeNotifier {
  late Themes activeTheme = Themes.darkTheme;

  bool get isLightTheme => activeTheme == Themes.lightTheme;
  bool get isDarkTheme => activeTheme == Themes.darkTheme;

  void switchTheme(Themes theme) {
    setSharedPreferencesTheme(theme).then((value) {
      activeTheme =
          theme == Themes.lightTheme ? Themes.lightTheme : Themes.darkTheme;
      notifyListeners();
    });
  }

  set setTheme(Themes theme) {
    switch (theme) {
      case Themes.lightTheme:
        switchTheme(Themes.lightTheme);
        break;
      case Themes.darkTheme:
        switchTheme(Themes.darkTheme);
        break;
      default:
        switchTheme(Themes.lightTheme);
        break;
    }
  }

  Future get sharedPreferencesTheme async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return await _prefs.then((SharedPreferences prefs) {
      String data = prefs.getString("theme") ?? "dark";
      return data == "light" ? Themes.lightTheme : Themes.darkTheme;
    });
  }

  Future setSharedPreferencesTheme(Themes newTheme) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return await _prefs.then((SharedPreferences prefs) {
      return prefs.setString(
          "theme", newTheme == Themes.lightTheme ? "light" : "dark");
    });
  }

  ThemeData get lightThemeData => LightTheme;

  ThemeData get darkThemeData => DarkTheme;
}
