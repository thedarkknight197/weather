import 'package:geolocator/geolocator.dart';
import 'package:weather/types/Themes/index.dart';
import 'package:weather/utilities/Temperature/index.dart';

class LoadSettings {
  final Themes theme;
  final Position position;
  // final Temperature unit;

  LoadSettings({
    required this.theme,
    required this.position,
    // required this.unit
  });
}
