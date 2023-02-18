import 'package:flutter_web/interface/i_cookie_service.dart';
import 'package:flutter_web/service/cookie_service.dart';

import 'service/open_weather_map.dart';
import 'interface/i_weather_api.dart';

Map<Type, dynamic Function()> _services = {
  IWeatherApi: () => new OpenWeatherMap(),
  ICookieService: () => new CookieService(),
};

dynamic GetTransient(Type interface_type) {
  dynamic service;
  var func = _services[interface_type];
  if(func != null){
    service = func();
  } else {
    throw new Exception("Service ${interface_type} not found!");
  }
  return service;
}

