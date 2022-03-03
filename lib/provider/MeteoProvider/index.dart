import 'package:flutter/material.dart';
import 'package:weather/models/MeteoData/MeteoData.dart';

class MeteoProvider extends ChangeNotifier {
  List<MeteoData> _meteo = [];

  List<MeteoData> get meteoData => _meteo;

  set meteoData(List<MeteoData> _data) {
    _meteo = _data;
    notifyListeners();
  }
}
