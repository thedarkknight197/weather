import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/City/City.dart';
import 'package:weather/models/MeteoData/MeteoData.dart';
import 'package:weather/provider/ThemeProvider/index.dart';
import 'package:weather/utilities/ColorSchema/index.dart';
import 'package:weather/utilities/Temperature/index.dart';

class HourContainer extends StatelessWidget {
  final MeteoData data;
  final Temperature currentUnit;
  final City city;
  const HourContainer(
      {Key? key,
      required this.data,
      required this.currentUnit,
      required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double temp = data.temp;
    return Container(
      height: 125,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context).isDarkTheme
            ? ColorSchema.darkBlue2
            : ColorSchema.blueAccent,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            15,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            height: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    "${data.hour < 10 ? '0${data.hour}' : data.hour}"
                    ":"
                    "${data.minutes < 10 ? '0${data.minutes}' : data.minutes} ",
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Text(
            temp.toInt().toString() + "$currentUnit",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              data.weather[0].image(
                data.hour,
                city.sunsetHour,
                city.sunriseHour,
              ),
              height: 50,
            ),
          ),
          // Positioned(
          //   right: 0,
          //   bottom: 0,
          //   child: Text(data.weather[0].description +
          //       data.weather[0].id.toString() +
          //       data.weather[0].main),
          // ),
        ],
      ),
    );
  }
}
