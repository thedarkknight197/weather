import 'package:flutter/material.dart';
import 'package:weather/utilities/Temperature/index.dart';

class UnitProvider extends ChangeNotifier {
  Temperature _currentTemperature = Temperature();

  Temperature get currentUnit => _currentTemperature;

  set currentUnit(Temperature newUnit) {
    _currentTemperature = newUnit;
    notifyListeners();
  }
}
