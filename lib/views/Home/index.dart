import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Layout/default.dart';
import 'package:weather/components/UI/DailyPrevisions/index.dart';
import 'package:weather/components/UI/HourContainer/index.dart';
import 'package:weather/components/UI/MyRow/MyRow.dart';
import 'package:weather/components/UI/RowWithDivider/RowWithDivider.dart';
import 'package:weather/controllers/RequestController/index.dart';
import 'package:weather/models/MeteoData/MeteoData.dart';
import 'package:weather/provider/CityProvider/index.dart';
import 'package:weather/provider/DaySelector/index.dart';
import 'package:weather/provider/MeteoProvider/index.dart';
import 'package:weather/provider/UnitProvider/index.dart';
import 'package:weather/utilities/Temperature/index.dart';
import 'package:weather/views/Setting/index.dart';

class HomePage extends StatelessWidget {
  static const String id = "/";
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Temperature currentUnit = Provider.of<UnitProvider>(context).currentUnit;

    Future<Map<String, dynamic>?> loadData() async {
      return RequestController().temperature;
    }

    List<MeteoData> filterNextDays(List<MeteoData> meteoData) {
      var nextDays = <MeteoData>{};
      return meteoData.where((meteo) {
        if (nextDays.where((element) => element.day == meteo.day).isEmpty) {
          nextDays.add(meteo);
          return true;
        } else {
          return false;
        }
      }).toList();
    }

    return DefaultLayout(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 19.0),
              child: GestureDetector(
                onTap: (() => Navigator.pushNamed(context, SettingPage.id)),
                child: const Icon(Icons.tune_rounded),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
            future: loadData().then((value) {
              Provider.of<MeteoProvider>(context, listen: false).meteoData =
                  value!['meteo'];
              Provider.of<CityProvider>(context, listen: false)
                  .currentLocation = value['city'];
              return value;
            }),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.error != null) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  List<MeteoData> meteoData =
                      Provider.of<MeteoProvider>(context, listen: true)
                          .meteoData;
                  CityProvider myCity =
                      Provider.of<CityProvider>(context, listen: true);
                  DaySelector index =
                      Provider.of<DaySelector>(context, listen: true);
                  List<MeteoData> listDates = filterNextDays(meteoData);
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        MyRow(
                          child: Text("${meteoData.first.day} "
                              "${meteoData.first.abbrMonth} "
                              "${meteoData.first.year} "),
                        ),
                        MyRow(
                            child: Image.asset(
                                meteoData.first.weather.first
                                    .image(meteoData.first.hour),
                                height: 95)),
                        MyRow(
                          child: Text(
                              "${myCity.currentLocation.name}, ${myCity.currentLocation.country}",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        MyRow(
                          child: SizedBox(
                            height: 40,
                            child: RowWithDivider(children: [
                              Text("${meteoData.first.temp_min} $currentUnit"),
                              Text("${meteoData.first.temp_max} $currentUnit"),
                            ]),
                          ),
                        ),
                        const MyRow(
                          child: Text(
                            "Questa settimana",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DailyPrevisions(
                          children: listDates,
                        ),
                        MyRow(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 19.0),
                            child: ListView(
                              shrinkWrap: true,
                              primary: false,
                              children: meteoData
                                  .asMap()
                                  .entries
                                  .where((element) =>
                                      element.value.day ==
                                      listDates[index.currentIndex].day)
                                  .map(
                                    (e) => HourContainer(
                                        currentUnit: currentUnit,
                                        data: e.value),
                                  )
                                  .toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const DefaultLayout(
                    child: SizedBox(),
                  );
                }
              } else {
                return const DefaultLayout(
                  child: SizedBox(),
                );
              }
            }),
      ),
    );
  }
}
