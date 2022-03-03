import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/ThemeProvider/index.dart';
import 'package:weather/utilities/ColorSchema/index.dart';

Future<void> changeTheme(BuildContext context) {
  ThemeProvider current = Provider.of<ThemeProvider>(context, listen: false);

  void changeTheme(Themes theme) {
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).setTheme = theme;
  }

  return showModalBottomSheet<void>(
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(
        color:
            current.isLightTheme ? Colors.grey.shade50 : ColorSchema.mulledWine,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: CupertinoPicker(
        itemExtent: 32.0,
        scrollController: FixedExtentScrollController(
          initialItem: current.isLightTheme ? 0 : 1,
        ),
        onSelectedItemChanged: (selectedIndex) {
          switch (selectedIndex) {
            case 0:
              changeTheme(Themes.lightTheme);
              break;
            case 1:
              changeTheme(Themes.darkTheme);
              break;
            default:
          }
        },
        children: [
          const Text("Light theme"),
          Text(
            "Dark theme",
            style: TextStyle(
                color: current.isLightTheme
                    ? ColorSchema.grey
                    : ColorSchema.silver),
          ),
        ],
      ),
    ),
  );
}
