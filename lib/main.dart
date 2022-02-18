import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web/view/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web/routes.dart';

SharedPreferences? prefs;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  registerRouters();
  prefs = await SharedPreferences.getInstance();
  runApp(const App());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'BBLJ氣象台',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 236, 222, 217),
        primarySwatch: Colors.orange,
      ),
      home: Index(),
      routes: routes, //routes.dart
    );
  }
}




