import 'package:flutter/material.dart';
import 'package:flutter_web/view/index.dart';
import 'data/data.dart';

Map<String, Widget Function(BuildContext)> routes = {};

void registerRouters(){
  cities.forEach((key, value) {
    routes['/${key}'] = (context) => Index();
  });

}