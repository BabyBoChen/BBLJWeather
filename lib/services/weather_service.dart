import 'dart:convert';


import 'package:http/http.dart';

import '../datas/wmo_code.dart';
import '../interfaces/i_weather_service.dart';

class WeatherService implements IWeatherService{
  @override
  Future<Map<String, dynamic>> getWeather(String coord) async {
    //print("getWeather");
    Uri url = Uri.parse('https://api.open-meteo.com/v1/forecast?'
        '${coord}&'
        'current=temperature_2m,precipitation,weather_code&'
        'hourly=temperature_2m,precipitation_probability,weather_code&'
        'daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&'
        'timezone=Asia%2FSingapore');
    Response response = await get(url);
    var weatherData = jsonDecode(response.body);
    return weatherData;
  }

  @override
  String getWeatherIconUrlFromWeatherCode(String code, String dateTime, [String size = "2x"]) {
    String dayNight = "day";
    var now = DateTime.parse(dateTime);
    if(now.hour >= 18 || now.hour <= 6){
      dayNight = "night";
    }
    String url = wmoCodes[code]![dayNight]!["image"]!;
    if(size == "4x"){
      url = wmoCodes[code]![dayNight]!["image"]!.replaceAll("2x", "4x");
    }
    return url;
  }

  @override
  String getWeatherDescFromWeatherCode(String code, String dateTime) {
    String dayNight = "day";
    var now = DateTime.parse(dateTime);
    if(now.hour >= 18){
      dayNight = "night";
    }
    return wmoCodes[code]![dayNight]!["description"]!;
  }
}