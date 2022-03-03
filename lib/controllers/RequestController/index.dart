import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/City/City.dart';
import 'package:weather/models/MeteoData/MeteoData.dart';
import 'package:weather/utilities/constants.dart';

class RequestController {
  Future<Map<String, dynamic>?> get temperature async {
    const String getParams =
        // "?lat=4.210484&lon=101.975766&appid=$APP_ID&units=metric&lang=it";
        "?lat=19.0760&lon=72.8777&appid=$APP_ID&units=metric&lang=it";
    Uri url = Uri.parse(BASE_URL + getParams);
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
    } else {
      try {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<MeteoData> meteo = List<MeteoData>.from(
            body['list'].map((item) => MeteoData.fromJson(item)).toList());
        City myLocation = City.fromJson(body['city']);
        return {'meteo': meteo, 'city': myLocation};
      } catch (e) {
        print(e);
      }
    }
  }
}
