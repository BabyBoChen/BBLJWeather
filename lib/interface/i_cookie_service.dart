import 'package:flutter_web/data/city_coord.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICookieService {
  static SharedPreferences? cookies;
  static Future initCookies() async{
    cookies = await SharedPreferences.getInstance();
  }
  CityCoord loadLastVisitedCity();
  Future saveLastVisitedCity(CityCoord city);
}