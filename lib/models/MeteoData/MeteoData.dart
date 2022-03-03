import 'package:intl/intl.dart';
import 'package:weather/models/MeteoData/Weather.dart';

class MeteoData {
  final int timestamp;
  final double temp;
  final double temp_min;
  final double temp_max;
  final List<Weather> weather;
  final String date;
  late int day;
  late String dayString;
  late int month;
  late String abbrMonth;
  late String longMonth;
  late int year;
  late int hour;
  late int minutes;

  MeteoData({
    required this.timestamp,
    required this.temp,
    required this.temp_min,
    required this.temp_max,
    required this.weather,
    required this.date,
  }) {
    DateTime fromMilliseconds =
        DateTime.fromMillisecondsSinceEpoch(this.timestamp * 1000);
    day = int.parse(DateFormat('dd').format(fromMilliseconds));
    dayString = DateFormat('EEEE').format(fromMilliseconds);
    month = int.parse(DateFormat('MM').format(fromMilliseconds));
    abbrMonth = (DateFormat('MMM').format(fromMilliseconds));
    year = int.parse(DateFormat('yyyy').format(fromMilliseconds));
    hour = int.parse(DateFormat('H').format(fromMilliseconds));
    minutes = int.parse(DateFormat('m').format(fromMilliseconds));
  }

  factory MeteoData.fromJson(Map<String, dynamic> json) {
    List<Weather> wether = List<Weather>.from(
        json['weather'].map((item) => Weather.fromJson(item)).toList());

    return MeteoData(
      timestamp: json['dt'],
      temp: json['main']['temp'].toDouble(),
      temp_min: json['main']['temp_min'].toDouble(),
      temp_max: json['main']['temp_max'].toDouble(),
      weather: wether,
      date: json['dt_txt'],
    );
  }
}
 /*
  {
    "dt": 1646233200,
    "main": {
      "temp": 23.95,
      "feels_like": 24.7,
      "temp_min": 23.95,
      "temp_max": 23.95,
      "pressure": 1012,
      "sea_level": 1012,
      "grnd_level": 998,
      "humidity": 88,
      "temp_kf": 0
    },
    "weather": [
      {
        "id": 500,
        "main": "Rain",
        "description": "pioggia leggera",
        "icon": "10n"
      }
    ],
    "clouds": {
      "all": 80
    },
    "wind": {
      "speed": 0.82,
      "deg": 332,
      "gust": 0.94
    },
    "visibility": 10000,
    "pop": 0.8,
    "rain": {
      "3h": 0.76
    },
    "sys": {
      "pod": "n"
    },
    "dt_txt": "2022-03-02 15:00:00"
  }
*/