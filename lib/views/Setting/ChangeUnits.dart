import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/ThemeProvider/index.dart';
import 'package:weather/provider/UnitProvider/index.dart';
import 'package:weather/types/Units/index.dart';
import 'package:weather/utilities/ColorSchema/index.dart';
import 'package:weather/utilities/Temperature/index.dart';

Future<void> changeUnits(BuildContext context) {
  ThemeProvider currentTheme =
      Provider.of<ThemeProvider>(context, listen: false);
  UnitProvider currentUnit = Provider.of<UnitProvider>(context, listen: false);

  TextStyle style = TextStyle(
      color: currentTheme.isLightTheme ? Colors.black : ColorSchema.silver);

  void changeUnits(Units newUnit) {
    Provider.of<UnitProvider>(
      context,
      listen: false,
    ).currentUnit = Temperature(unit: newUnit);
  }

  return showModalBottomSheet<void>(
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(
        color: currentTheme.isLightTheme
            ? Colors.grey.shade50
            : ColorSchema.mulledWine,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: CupertinoPicker(
        itemExtent: 32.0,
        scrollController: FixedExtentScrollController(
          initialItem: currentUnit.currentUnit.unit == Units.Celsius ? 0 : 1,
        ),
        onSelectedItemChanged: (selectedIndex) {
          switch (selectedIndex) {
            case 0:
              changeUnits(Units.Celsius);
              break;
            case 1:
              changeUnits(Units.Fahrenheit);
              break;
            default:
          }
        },
        children: [
          Text("°${Temperature.CELSIUS}", style: style),
          Text("°${Temperature.FAHRENHEIT}", style: style),
        ],
      ),
    ),
  );
}
