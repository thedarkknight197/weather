import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weather/models/City/City.dart';
import 'package:weather/models/MeteoData/MeteoData.dart';
import 'package:weather/provider/PositionProvider/index.dart';
import 'package:weather/provider/UnitProvider/index.dart';
import 'package:weather/utilities/constants.dart';

class RequestController {
  final BuildContext context;
  RequestController({required this.context});

  Future<Map<String, dynamic>?> get temperature async {
    Position currentLocation =
        Provider.of<PositionProvider>(context).currentLocation;
    UnitProvider currentUnit = Provider.of<UnitProvider>(context);
    String getParams = "?"
        "lat=${currentLocation.latitude}"
        "&lon=${currentLocation.longitude}"
        "&appid=$APP_ID"
        "&units=$currentUnit"
        "&lang=it";
    Uri url = Uri.parse(BASE_URL + getParams);
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
      return Future.error("Failed calling server");
    } else {
      try {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<MeteoData> meteo = List<MeteoData>.from(
            body['list'].map((item) => MeteoData.fromJson(item)).toList());
        City myLocation = City.fromJson(body['city']);
        return {'meteo': meteo, 'city': myLocation};
      } catch (e) {
        return Future.error(e);
      }
    }
  }
}
