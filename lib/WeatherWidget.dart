import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_demo/WeatherData.dart';
import 'package:http/http.dart' as http;

class WeatherWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WeatherState();
  }
}

class WeatherState extends State<WeatherWidget> {
  WeatherData weatherData = WeatherData.empty();

  WeatherState() {
    _getWeather('广州');
  }

  //异步获取天气信息
  void _getWeather(city) async {
    print('点我了');
    WeatherData data = await _fetchWeatherData(city);
    //获取到信息后，设置状态刷新页面
    setState(() {
      weatherData = data;
    });
  }

  Future<WeatherData> _fetchWeatherData(city) async {
    //请求接口获取天气信息
    final response = await http.get(
        'https://free-api.heweather.com/s6/weather/now?location=' +
            city +
            '&key=a90756aa8a32400b9cbc2d7ec59e9f35');
    if (response.statusCode == 200) {
      print(response.body);
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      return WeatherData.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            "images/1.jpg",
            fit: BoxFit.fitHeight,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 50.0),
                child: new Text(
                  weatherData.city,
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
              new Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 280.0),
                child: new Column(
                  children: <Widget>[
                    new Text(
                      weatherData.tmp,
                      style: new TextStyle(color: Colors.white, fontSize: 80.0),
                    ),
                    new Text(
                      weatherData.cond,
                      style: new TextStyle(color: Colors.white, fontSize: 45.0),
                    ),
                    new Text(
                      weatherData.hum,
                      style: new TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    new FlatButton(
                        child: Text(weatherData.updateTime,
                            style: new TextStyle(
                                color: Colors.white, fontSize: 25.0)),
                        onPressed: () {
//                          showAlertDialog(context);
                          _getWeather('深圳');
                        }),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
                title: Text("请输入要城市名称"),
                content: Text("广州"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("取消"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new TextField(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]));
  }
}
