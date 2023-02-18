import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/view/daily.dart';
import 'package:flutter_web/view/hourly.dart';
import 'package:flutter_web/data/city_coord.dart';

class WeatherDetail extends StatelessWidget {

  final Map<String, dynamic> weatherData;
  final CityCoord city;

  const WeatherDetail({Key? key, required this.city, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: _buildItems(),
        );
      },
    );
  }

  List<Widget> _buildItems(){
    String weatherDesc = weatherData['current']['weather'][0]['description'];
    String temp = weatherData['current']['temp'].toString();
    String iconUrl = 'https://openweathermap.org/img/wn/${weatherData["current"]['weather'][0]['icon']}@4x.png';
    //print(iconUrl);
    List<Widget> items = [];
    items.addAll([
      //現在的天氣概況示意圖-------------------------------------
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(iconUrl,
            fit: BoxFit.fill,
          ),
        ],
      ),
      //現在的天氣概況------------------------------------------
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right:10.0),
            child: Text('觀測站：', textScaleFactor: 1.5,),
          ),
          Container(
            child: Text(city.district, textScaleFactor: 1.5,),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right:10.0),
            child: Text('天氣概況：', textScaleFactor: 1.5,),
          ),
          Container(
            child: Text(weatherDesc, textScaleFactor: 1.5,),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right:10.0),
            child: Text('溫度：', textScaleFactor: 1.5,),
          ),
          Container(
            child: Text('${temp}°C', textScaleFactor: 1.5,),
          ),
        ],
      ),
      Container(
        height: 10,
      ),
      // 今日天氣預報--------------------------------------------
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right:10.0),
            child: Text('今日天氣預報：', textScaleFactor: 1.5,),
          ),
        ],
      ),
      Hourly(hourly: weatherData['hourly']),
      Container(
        height: 10,
      ),
      // 一周天氣預報--------------------------------------------
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right:10.0),
            child: Text('一周天氣預報：', textScaleFactor: 1.5,),
          ),
        ],
      ),
      Container(
        height: 5,
      ),
    ]);
    items.addAll(_getDailies(weatherData['daily']));
    // ----------------------------------------------------
    return items;
  }

  List<Widget> _getDailies(List<dynamic> days) {
    List<Widget> dailies = [];
    days.forEach((day) {
      Widget daily = Daily(day: day);
      dailies.add(daily);
    });
    return dailies;
  }

}
