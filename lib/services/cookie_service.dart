import '../interfaces/i_cookie_service.dart';

class CookieService implements ICookieService {
  @override
  String? getCookie(String key) {
    String? val = ICookieService.cookies!.getString(key);
    return val;
  }

  @override
  void setCookie(String key, String val) {
    ICookieService.cookies!.setString(key, val);
  }
}