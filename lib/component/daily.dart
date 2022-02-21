import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_web/data/data.dart';

class Daily extends StatelessWidget {

  final dynamic day;

  const Daily({Key? key, required this.day}) : super(key: key);

  String _getWeekDay(int wd){
    if(wd == 1){
      return "Mon";
    }else if (wd == 2){
      return "Tue";
    }else if (wd == 3){
      return "Wed";
    }else if (wd == 4){
      return "Thr";
    }else if (wd == 5){
      return "Fri";
    }else if (wd == 6){
      return "Sat";
    }else if (wd == 7){
      return "Sun";
    }else{
      return "";
    }
  }

  double _getHottest(dynamic temps){
    Map<String, double> dayTemps = Map.from(temps);
    double hottest = -99.0;
    dayTemps.forEach((key, value) {
      if (value >= hottest){
        hottest = value;
      }
    });
    return hottest;
  }

  double _getColdest(dynamic temps){
    Map<String, double> dayTemps = Map.from(temps);
    double coldest = 99.0;
    dayTemps.forEach((key, value) {
      if (value <= coldest){
        coldest = value;
      }
    });
    return coldest;
  }

  @override
  Widget build(BuildContext context) {
    int offsetSec = day['dt'] as int;
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(offsetSec * 1000);
    String MM = '';
    if (dt.month < 10){
      MM = "0${dt.month}";
    }else{
      MM = "${dt.month}";
    }
    String dd = '';
    if(dt.day < 10){
      dd = "0${dt.day}";
    }else{
      dd = "${dt.day}";
    }
    var percentageFormat = NumberFormat("##0");
    String pop = percentageFormat.format(day['pop']*100)+'%';
    String wd = _getWeekDay(dt.weekday);
    String iconUrl = "https://openweathermap.org/img/wn/${day['weather'][0]['icon']}@2x.png";
    return Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
      ),
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(top:5.0, left: 10.0, right: 10.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Text("${wd}"),
                Text("${MM}/${dd}"),
              ],
            ),
            Container(
              width: 30,
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Image.network(iconUrl,fit: BoxFit.fill),
            ),
            Container(
              width: 30,
            ),
            Column(
              children: [
                Text("${day['weather'][0]['description']}(降雨: ${pop})"),
                Text("${_getColdest(day['temp'])}°C~${_getHottest(day['temp'])}°C"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

