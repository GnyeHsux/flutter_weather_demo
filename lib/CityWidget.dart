import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_demo/CityData.dart';
import 'package:flutter_weather_demo/WeatherWidget.dart';
import 'package:http/http.dart' as http;

class CityWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CityState();
  }
}

class CityState extends State<CityWidget> {
  List<CityData> cityList = new List<CityData>();

  CityState() {
    _getCityList();
  }

  void _getCityList() async {
    List<CityData> citys = await _fetchCityList();
    setState(() {
      cityList = citys;
    });
  }

  Future<List<CityData>> _fetchCityList() async {
    final response = await http.get(
        'https://search.heweather.net/top?group=cn&key=a90756aa8a32400b9cbc2d7ec59e9f35');

    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      for (dynamic data in result['HeWeather6'][0]['basic']) {
        CityData cityData = CityData(data['location']);
        cityList.add(cityData);
      }
    }
    return cityList;
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: AppBar(
        title: Text("选择城市"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListView.builder(
              itemCount: cityList.length,
              itemBuilder: (context, index) {

                return ListTile(
                  title: GestureDetector(
                    child: Text(cityList[index].cityName),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WeatherWidget(cityList[index].cityName))
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );*/
    return ListView.builder(
        itemCount: cityList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: GestureDetector(
              child: Text(cityList[index].cityName),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WeatherWidget(cityList[index].cityName)));
              },
            ),
          );
        });
  }
}
