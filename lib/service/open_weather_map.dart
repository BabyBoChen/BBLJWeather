import 'dart:convert';

import 'package:flutter_web/data/secret.dart';
import 'package:http/http.dart';

import '../interface/i_weather_api.dart';

class OpenWeatherMap implements IWeatherApi {
  @override
  Future<Map<String, dynamic>> getWeather(String coord) async {
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?'
        '${coord}&appid=${appId}&units=metric&lang=zh_tw');
    //print(url);
    Response response = await get(url);
    var weatherData = jsonDecode(response.body);
    return weatherData;
  }
}