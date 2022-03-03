import 'package:weather/controllers/PositionController/index.dart';

class InitializeController {
  static Future initialize() async {
    try {
      await _registerServices();
      return await _loadSettings();
    } catch (e) {
      return Future.error(e);
    }
  }

  static _registerServices() async {
    // print("starting registering services");
    // await Future.delayed(Duration(seconds: 1));
    // print("finished registering services");
  }

  static _loadSettings() async {
    //TODO load settings
    // print("starting loading settings");
    return await PositionController().determinePosition();
    // print("finished loading settings");
  }
}
