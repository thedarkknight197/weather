import 'package:flutter/material.dart';
import 'package:weather/models/City/City.dart';

class CityProvider extends ChangeNotifier {
  late City _city;

  City get currentLocation => _city;

  set currentLocation(City newLocation) {
    _city = newLocation;
    notifyListeners();
  }
}
