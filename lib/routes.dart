import 'package:flutter/material.dart';
import 'package:flutter_web/view/index.dart';
import 'data/data.dart';

Map<String, Widget Function(BuildContext)> routes = {};

void registerRoutes(){
  cities.forEach((key, value) {
    routes['/${key}'] = (context) => const Index();
  });
}