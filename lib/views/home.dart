import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../services/cookie_service.dart';
import 'body.dart';
import 'nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  String? city = null;

  @override
  Widget build(BuildContext context) {
    var cs = new CookieService();
    city = cs.getCookie("city");
    if(city == null){
      city = "Taipei";
    }
    return  CupertinoPageScaffold(
      navigationBar: navBar(context, this),
      child: new BodyWidget(),
    );
  }

  void changeCity(String cityNameE){
    var cs = CookieService();
    cs.setCookie("city", cityNameE);
    this.setState(() {
      this.city = cityNameE;
    });
    BodyWidgetState.refresh();
  }
}