import 'package:intl/intl.dart';

class Coord {
  final double lat;
  final double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int sunrise;
  late int sunriseHour;
  final int sunset;
  late int sunsetHour;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.sunrise,
    required this.sunset,
  }) {
    DateTime sunriseFromMilliseconds =
        DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
    sunriseHour = int.parse(DateFormat('H').format(sunriseFromMilliseconds));
    DateTime sunsetFromMilliseconds =
        DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
    sunsetHour = int.parse(DateFormat('H').format(sunsetFromMilliseconds));
  }

  factory City.fromJson(Map<String, dynamic> json) {
    Coord coord = Coord.fromJson(json['coord']);

    return City(
      id: json['id'],
      name: json['name'],
      coord: coord,
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

/*
  "city": {
      "id": 1733023,
      "name": "Kuala Lipis",
      "coord": {
        "lat": 4.2105,
        "lon": 101.9758
      },
      "country": "MY",
      "population": 15448,
      "timezone": 28800,
      "sunrise": 1646263380,
      "sunset": 1646306736
  }
*/