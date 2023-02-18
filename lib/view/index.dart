import 'package:flutter/material.dart';
import 'package:flutter_web/data/city_coord.dart';
import 'package:flutter_web/interface/i_cookie_service.dart';
import 'package:flutter_web/interface/i_weather_api.dart';
import 'package:flutter_web/service_injection.dart';
import 'package:flutter_web/view/bblj_drawer.dart';
import 'package:flutter_web/view/weather_detail.dart';


class Index extends StatelessWidget {

  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //從route中解析CityCoord (類似解析query string)
    //如果route中沒有CityCoord, 嘗試從cookie中讀取上一次查詢的CityCoord
    CityCoord theCity = new CityCoord();
    if(ModalRoute.of(context)!.settings.arguments == null){
      theCity = (GetTransient(ICookieService) as ICookieService).loadLastVisitedCity();
    }else{
      theCity = ModalRoute.of(context)!.settings.arguments as CityCoord;
    }
    //print(theCity);

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
        title: Text(theCity.cityName),
      ),
      drawer: const BBLJDrawer(),
      body: FutureBuilder(
        future: (GetTransient(IWeatherApi) as IWeatherApi).getWeather(theCity.coord),
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            return WeatherDetail(city:theCity, weatherData: snapshot.data!);
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
