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
  final int sunset;

  const City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

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