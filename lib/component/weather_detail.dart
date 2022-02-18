import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/component/daily.dart';
import 'package:flutter_web/component/hourly.dart';
import 'package:flutter_web/data/data.dart';

class WeatherDetail extends StatefulWidget {

  final Map<String, dynamic> weatherData;
  final Map<String, dynamic> city;

  const WeatherDetail({Key? key,required this.city, required this.weatherData}) : super(key: key);

  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {

  @override
  initState() {
    super.initState();
  }

  List<Widget> _getDailies(List<dynamic> days){
    List<Widget> dailies = [];
    days.forEach((day) {
      Widget daily = Daily(day: day);
      dailies.add(daily);
    });
    return dailies;
  }

  List<Widget> _getItems(){
    Map<String, dynamic> weatherData = widget.weatherData;
    String weatherDesc = weatherData['current']['weather'][0]['description'];
    String temp = weatherData['current']['temp'].toString();
    String iconUrl = 'https://openweathermap.org/img/wn/${weatherData["current"]['weather'][0]['icon']}@4x.png';
    print(iconUrl);
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
            child: Text(widget.city["district"], textScaleFactor: 1.5,),
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
          padding: const EdgeInsets.all(10.0),
          children: _getItems(),
        );
      },
    );
  }
}
