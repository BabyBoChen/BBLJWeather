import 'package:flutter/cupertino.dart';


import '../datas/city_coord.dart';
import '../services/cookie_service.dart';
import '../services/weather_service.dart';
import 'daily.dart';
import 'hourly.dart';

class BodyWidget extends StatefulWidget {

  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() {
    return new BodyWidgetState();
  }
}

class BodyWidgetState extends State<BodyWidget> {
  String? cityNameE;
  Map<String, dynamic>? weatherInfos = null;
  String weatherIconUrl = "images/00d@4x.png";
  String district = "";
  String desc = "";
  String temp = "0°C";
  List<Map<String, String>> hourly = [
    {
      "time": "00:00",
      "temp": "0°C",
      "pp": "0%",
      "iconUrl": "images/00d@2x.png",
    },
  ];
  List<Map<String, String>> daily = [
    {
      "day": "Sun",
      "date": "01/01",
      "iconUrl": "images/01d@2x.png",
      "desc": "",
      "pp": "0%",
      "minTemp": "0°C",
      "maxTemp": "0°C",
    },
  ];

  @override
  void initState() {
    super.initState();
    BodyWidgetState._bodyState = this;
    BodyWidgetState.refresh();
  }

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

  @override
  Widget build(BuildContext context) {
    var body = SingleChildScrollView(
      child:Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 40, 5, 0),
          child: Center(
            child: SizedBox(
              width: 200.0,
              height: 200.0,
              child: Image.asset(weatherIconUrl, fit: BoxFit.fill),
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("觀測站：${this.district}", textScaler: TextScaler.linear(1.5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("天氣概況：${this.desc}", textScaler: TextScaler.linear(1.5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("溫度：${this.temp}", textScaler: TextScaler.linear(1.5)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child:Text("今日天氣預報：", textScaler: TextScaler.linear(1.5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          child:Align(
            alignment: Alignment.centerLeft,
            child:SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:Row(
                children:hourlyInfos(hourly),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child:Text("一周天氣預報：", textScaler: TextScaler.linear(1.5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          child:Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: dailyInfos(this.daily),
            ),
          ),
        ),
      ])
    );
    return body;
  }

  static BodyWidgetState? _bodyState;
  static void refresh(){
    if(_bodyState != null){
      var cs = new CookieService();
      _bodyState!.cityNameE = cs.getCookie("city");
      if(_bodyState!.cityNameE == null){
        _bodyState!.cityNameE = "Taipei";
      }
      var ws = new WeatherService();
      var cityCoord = CityCoord.fromJson(_bodyState!.cityNameE!, cities[_bodyState!.cityNameE]!.cast());
      ws.getWeather(cityCoord.coord).then((w) {
        _bodyState!.setState(() {
          _bodyState!.weatherInfos = w;
          _bodyState!.weatherIconUrl ="images/${ws.getWeatherIconUrlFromWeatherCode(
            w["current"]["weather_code"].toString(),
            w["current"]["time"], "4x",
          )}";
          _bodyState!.district = cityCoord.district;
          _bodyState!.desc = ws.getWeatherDescFromWeatherCode(
              w["current"]["weather_code"].toString(), w["current"]["time"]);
          _bodyState!.temp = w["current"]["temperature_2m"].toString() + "°C";
          var now = DateTime.now();
          now = new DateTime(now.year, now.month, now.day, now.hour, 0, 0);
          var index = 0;
          for(int i = 0; i < w["hourly"]["time"].length; i++){
            var t = DateTime.parse(w["hourly"]["time"][i]);
            if(t == now || t.isAfter(now)){
              index = i;
              break;
            }
          }
          _bodyState!.hourly.clear();
          for(int i = index; i < index+12; i++){
            var t = DateTime.parse(w["hourly"]["time"][i]);
            var temp = w["hourly"]["temperature_2m"][i].toString();
            var pp = w["hourly"]["precipitation_probability"][i].toString();
            var wc = w["hourly"]["weather_code"][i].toString();
            //print("${t.hour.toString().padLeft(2, "0")}:00");
            Map<String, String> hw = {
              "time": "${t.hour.toString().padLeft(2, "0")}:00",
              "temp": temp + "°C",
              "pp":pp + "%",
              "iconUrl": "images/${ws.getWeatherIconUrlFromWeatherCode(wc, w["hourly"]["time"][i])}",
            };
            _bodyState!.hourly.add(hw);
          };
          //print(hourly);
          _bodyState!.daily.clear();
          for(int i = 0; i < w["daily"]["time"].length; i++){
            var date = DateTime.parse(w["daily"]["time"][i].toString());
            date = date.add(Duration(hours: 7));
            var day = _bodyState!._getWeekDay(date.weekday);
            var wc = w["daily"]["weather_code"][i];
            var iconUrl = "images/${ws.getWeatherIconUrlFromWeatherCode(wc.toString(), date.toString())}";
            var desc = ws.getWeatherDescFromWeatherCode(wc.toString(), w["daily"]["time"][i].toString());
            var pp = w["daily"]["precipitation_probability_max"][i];
            var minTemp = w["daily"]["temperature_2m_min"][i];
            var maxTemp = w["daily"]["temperature_2m_max"][i];
            _bodyState!.daily.add({
              "day": day,
              "date": "${date.month.toString().padLeft(2, "0")}/${date.day.toString().padLeft(2, "0")}",
              "iconUrl": iconUrl,
              "desc": desc,
              "pp": pp.toString() + "%",
              "minTemp": minTemp.toString() + "°C",
              "maxTemp": maxTemp.toString() + "°C",
            });
            //print(daily);
          }
        });
      });
    }
  }
}