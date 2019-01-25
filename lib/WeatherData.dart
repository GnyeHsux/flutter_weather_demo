class WeatherData {
  String city;
  String cond; //天气
  String tmp; //温度
  String hum; //湿度
  String updateTime; //更新时间

  WeatherData({this.city, this.cond, this.tmp, this.hum, this.updateTime});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        city: json['HeWeather6'][0]['basic']['location'],
        cond: json['HeWeather6'][0]['now']['cond_txt'],
        tmp: json['HeWeather6'][0]['now']['tmp'] + "°",
        hum: "湿度  " + json['HeWeather6'][0]['now']['hum'] + "%" + " " +
            json['HeWeather6'][0]['now']['wind_dir'],
        updateTime: json['HeWeather6'][0]['update']['loc']
    );
  }

  factory WeatherData.empty() {
    return WeatherData(
      city: "",
      cond: "",
      tmp: "",
      hum: "",
      updateTime: "",
    );
  }
}