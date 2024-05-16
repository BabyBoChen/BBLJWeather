import 'package:shared_preferences/shared_preferences.dart';

abstract class ICookieService {
  static SharedPreferences? cookies;
  static Future initCookies() async{
    cookies = await SharedPreferences.getInstance();
  }
  String? getCookie(String key);
  void setCookie(String key, String val);
}