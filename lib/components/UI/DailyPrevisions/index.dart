import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/components/UI/MyRow/MyRow.dart';
import 'package:weather/models/MeteoData/MeteoData.dart';
import 'package:weather/provider/DaySelector/index.dart';
import 'package:weather/provider/UnitProvider/index.dart';
import 'package:weather/utilities/ColorSchema/index.dart';
import 'package:weather/utilities/Temperature/index.dart';

class DailyPrevisions extends StatelessWidget {
  final List<MeteoData> children;
  const DailyPrevisions({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentIndex =
        Provider.of<DaySelector>(context, listen: true).currentIndex;

    Temperature currentUnit = Provider.of<UnitProvider>(context).currentUnit;

    void changeIndex(int newIndex) {
      Provider.of<DaySelector>(context, listen: false).currentIndex = newIndex;
    }

    return MyRow(
      child: SizedBox(
        height: 80,
        child: ListView(
            primary: false,
            scrollDirection: Axis.horizontal,
            children: children
                .asMap()
                .entries
                .map(
                  (e) => GestureDetector(
                    onTap: () => changeIndex(e.key),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: e.key == currentIndex
                            ? ColorSchema.blueAccent
                            : ColorSchema.darkBlue2,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      margin:
                          EdgeInsets.fromLTRB(e.key == 0 ? 19 : 0, 0, 19, 0),
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Image.asset(e.value.weather.first.image(e.value.hour),
                              height: 50),
                          Positioned(
                            right: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  e.value.dayString,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "${e.value.day.toString()} ${e.value.abbrMonth}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
