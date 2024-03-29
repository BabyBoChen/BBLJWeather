import 'package:flutter/material.dart';
import 'package:flutter_web/data/city_coord.dart';
import 'package:flutter_web/data/data.dart';
import 'package:flutter_web/interface/i_cookie_service.dart';
import 'package:flutter_web/service_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web/main.dart';

class BBLJDrawer extends StatefulWidget {
  const BBLJDrawer({Key? key}) : super(key: key);

  @override
  _BBLJDrawerState createState() => _BBLJDrawerState();
}

class _BBLJDrawerState extends State<BBLJDrawer> {

  List<Widget> _drawerBuilder(){
    List<Widget> drawerItems = [];
    var drawerHeader = const DrawerHeader(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("images/CatyBo.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Text('BBLJ氣象台',
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    drawerItems.add(drawerHeader);
    var cityNameEs = cities.keys.toList();
    for(var i = 0; i < cityNameEs.length; i++){
      var cityNameE = cityNameEs[i];
      CityCoord city = CityCoord.fromJson(cityNameEs[i], cities[cityNameE]!);
      var tile = ListTile(
        title: Text(city.cityName,
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.white),
        ),
        onTap:  () async {
          var cookieService = GetTransient(ICookieService) as ICookieService;
          await cookieService.saveLastVisitedCity(city);
          Navigator.of(context).pushNamed('/${cityNameE}', arguments: city,);
        },
      );
      drawerItems.add(tile);
    }
    return drawerItems;
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: const Color(0xff769fcd),
      child: ListView(
        controller: ScrollController(),
        children: _drawerBuilder(),
      ),
    );
  }
}

// ListView.builder(
// itemCount: cityNames.length,
// itemBuilder: (context, i){
// var cityName = cityNames[i];
// var tile = ListTile(
// title: Text(cities[cityName]!['cityName']!, textScaleFactor: 1.5,),
// onTap:  () async {
// await prefs!.setString('City', cityName);
// Navigator.of(context).pushNamed(
// '/${cityName}',
// arguments: cities[cityName],
// );
// },
// );
// return tile;
// },
// ),
