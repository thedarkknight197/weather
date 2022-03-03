enum Units { Celsius, Fahrenheit }

class Temperature {
  final Units unit;

  Temperature({this.unit = Units.Celsius});

  static const String CELSIUS = "C";
  static const String FAHRENHEIT = "F";

  set unit(Units newUnit) {
    unit = newUnit;
  }

  @override
  String toString() {
    switch (unit) {
      case Units.Celsius:
        return "°C";
      case Units.Fahrenheit:
        return "°F";
      default:
        return "°C";
    }
  }

  String apiValue() {
    switch (unit) {
      case Units.Celsius:
        return "metric";
      case Units.Fahrenheit:
        return "imperial";
      default:
        return "metric";
    }
  }
}
