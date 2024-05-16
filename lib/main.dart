import 'package:BBLJWeather/views/bblj_scrollbehavior.dart';
import 'package:BBLJWeather/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'interfaces/i_cookie_service.dart';


void main() async {
  await ICookieService.initCookies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CupertinoApp(
    scrollBehavior: BBLJScrollBehavior(),
    title:"BBLJ氣象台",
    home: const Home(),
    debugShowCheckedModeBanner: false,
  ));
}
