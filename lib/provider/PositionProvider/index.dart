import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PositionProvider extends ChangeNotifier {
  late Position _location;

  Position get currentLocation => _location;

  set currentLocation(Position newLocation) {
    _location = newLocation;
    notifyListeners();
  }
}
