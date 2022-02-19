import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_web/component/bblj_drawer.dart';
import 'package:flutter_web/component/weather_detail.dart';
import 'package:flutter_web/data/data.dart';
import 'package:flutter_web/data/secret.dart';
import 'dart:convert';
import 'package:flutter_web/main.dart';

class Index extends StatelessWidget {

  const Index({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> getWeather(String coord) async{
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?'
        '${coord}&appid=${appId}&units=metric&lang=zh_tw');
    //print(url);
    Response response = await get(url);
    var weatherData = jsonDecode(response.body);
    return weatherData;
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
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            return WeatherDetail(city:args, weatherData: snapshot.data!);
          }else {
            return Center(
              //child: Image.asset("images/loading.gif"),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("images/loading.gif", fit: BoxFit.contain,),
              ),
            );
          }
        }
      )
    );
  }
}
