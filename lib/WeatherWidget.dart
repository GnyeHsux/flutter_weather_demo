import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WeatherState();
  }
}

class WeatherState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            "images/weather_bg.jpg",
            fit: BoxFit.fitHeight,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 40.0),
                child: new Text(
                  "广州市",
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
              new Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 100.0),
                child: new Column(
                  children: <Widget>[
                    new Text(
                      "20 °",
                      style: new TextStyle(color: Colors.white, fontSize: 80.0),
                    ),
                    new Text(
                      "晴",
                      style: new TextStyle(color: Colors.white, fontSize: 45.0),
                    ),
                    new Text(
                      "湿度  80%",
                      style: new TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
