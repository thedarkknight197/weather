import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/utilities/Temperature/index.dart';

class UnitProvider extends ChangeNotifier {
  Temperature _currentTemperature = Temperature();

  Temperature get currentUnit => _currentTemperature;

  @override
  String toString() {
    return _currentTemperature.apiValue();
  }

  // Future get sharedPreferencesUnits async {
  //   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //   return await _prefs.then((SharedPreferences prefs) {
  //     prefs.getString("units");
  //     String data = prefs.getString("units") ?? Temperature.CELSIUS;
  //     return data == Temperature.CELSIUS
  //         ? Temperature(unit: Units.Celsius)
  //         : Temperature(unit: Units.Fahrenheit);
  //   });
  // }

  // Future setSharedPreferencesUnits(Temperature unit) async {
  //   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //   return await _prefs.then((SharedPreferences prefs) {
  //     return prefs.setString("units", unit.toString());
  //   });
  // }

  void switchUnits(Temperature newTemperature) {
    // setSharedPreferencesUnits(newTemperature)
    //     .then((value) => currentUnit = newTemperature);
    _currentTemperature = newTemperature;
    notifyListeners();
  }

  set currentUnit(Temperature newUnit) {
    switchUnits(newUnit);
  }
}
