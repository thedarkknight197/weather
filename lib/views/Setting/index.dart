import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Layout/default.dart';
import 'package:weather/components/UI/MyRow/MyRow.dart';
import 'package:weather/provider/ThemeProvider/index.dart';
import 'package:weather/provider/UnitProvider/index.dart';
import 'package:weather/utilities/Temperature/index.dart';
import 'package:weather/views/Setting/ChangeTheme.dart';
import 'package:weather/views/Setting/ChangeUnits.dart';

class SettingPage extends StatefulWidget {
  static const String id = "/settings";
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    Temperature currentUnit =
        Provider.of<UnitProvider>(context, listen: true).currentUnit;
    return DefaultLayout(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.0),
          child: Column(
            children: [
              MyRow(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Units:"),
                    GestureDetector(
                      onTap: () => changeUnits(context),
                      child: Text(
                        "$currentUnit",
                      ),
                    ),
                  ],
                ),
              ),
              MyRow(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Theme selected:"),
                    GestureDetector(
                      onTap: () => changeTheme(context),
                      child: Text(
                        Provider.of<ThemeProvider>(
                                  context,
                                ).activeTheme ==
                                Themes.lightTheme
                            ? "Light"
                            : "Dark",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
