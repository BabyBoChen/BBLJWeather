import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/component/daily.dart';
import 'package:flutter_web/component/hourly.dart';

class WeatherDetail extends StatelessWidget {

  final Map<String, dynamic> weatherData;
  final Map<String, dynamic> city;

  const WeatherDetail({Key? key,required this.city, required this.weatherData}) : super(key: key);

  List<Widget> _getDailies(List<dynamic> days) {
    List<Widget> dailies = [];
    days.forEach((day) {
      Widget daily = Daily(day: day);
      dailies.add(daily);
    });
    return dailies;
  }

  List<Widget> _getItems(){
    String weatherDesc = weatherData['current']['weather'][0]['description'];
    String temp = weatherData['current']['temp'].toString();
    String iconUrl = 'https://openweathermap.org/img/wn/${weatherData["current"]['weather'][0]['icon']}@4x.png';
    //print(iconUrl);
    List<Widget> items = [];
    items.addAll([
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(iconUrl,
            fit: BoxFit.fill,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right:10.0),
            child: Text('觀測站：', textScaleFactor: 1.5,),
          ),
          Container(
            child: Text(city["district"], textScaleFactor: 1.5,),
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
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          children: _getItems(),
        );
      },
    );
  }
}
