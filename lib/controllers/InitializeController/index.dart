import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather/controllers/PositionController/index.dart';
import 'package:weather/models/LoadSettingsData/index.dart';
import 'package:weather/provider/ThemeProvider/index.dart';
import 'package:weather/types/Themes/index.dart';

class InitializeController {
  static Future<LoadSettings> initialize(BuildContext context) async {
    try {
      await _registerServices(context);
      return await _loadSettings(context);
    } catch (e) {
      return Future.error(e);
    }
  }

  static _registerServices(BuildContext context) async {}

  static _loadSettings(BuildContext context) async {
    Themes theme = await Provider.of<ThemeProvider>(context, listen: false)
        .sharedPreferencesTheme;
    // Temperature units = await Provider.of<UnitProvider>(context, listen: false)
    //     .sharedPreferencesUnits;
    Position position = await PositionController().determinePosition();
    return LoadSettings(
      theme: theme, position: position,
      // unit: units
    );
  }
}
