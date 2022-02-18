import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_web/component/bblj_drawer.dart';
import 'package:flutter_web/component/weather_detail.dart';
import 'package:flutter_web/data/data.dart';
import 'package:flutter_web/data/secret.dart';
import 'dart:convert';
import 'package:flutter_web/main.dart';
import 'package:flutter_web/component/hourly.dart';

class Index extends StatefulWidget{

  String title = 'BBLJ氣象台';

  Index({Key? key}) : super(key:key);

  @override
  State<Index> createState() {
    return _Index();
  }

}

class _Index extends State<Index>{

  Map<String, dynamic> weatherData = {};

  Future getWeather(String coord) async{
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?'
        '${coord}&appid=${appId}&units=metric&lang=zh_tw');
    print(url);
    Response response = await get(url);
    weatherData = jsonDecode(response.body);
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = {};
    if(ModalRoute.of(context)!.settings.arguments == null){
      if(prefs!.getString('City')== null){
        args = cities['Taipei']!;
      }else{
        args = cities[prefs!.getString('City')]!;
      }
    }else{
      args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    }
    //print(args);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (leadingContext) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(leadingContext).openDrawer();
              },
              tooltip: '開啟左側選單',
            );
          },
        ),
        title: Text(args['cityName']!),
      ),
      drawer: const BBLJDrawer(),
      body: FutureBuilder(
        future: getWeather(args['coord']!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/loading.gif"),
                ),
              ),
            );
          } else {
            return WeatherDetail(city:args, weatherData: weatherData);
          }
        }
      )
    );
  }
}