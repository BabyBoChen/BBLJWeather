import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/data/data.dart';
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
        color: Colors.orange,
        image: const DecorationImage(
          image: AssetImage("images/CatyBo.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Text('BBLJ氣象台',
          textScaleFactor: 1.5,
        ),
      ),
    );
    drawerItems.add(drawerHeader);
    var cityNames = cities.keys.toList();
    for(var i = 0; i < cityNames.length; i++){
      var cityName = cityNames[i];
      var tile = ListTile(
        title: Text(cities[cityName]!['cityName']!, textScaleFactor: 1.5,),
        onTap:  () async {
          await prefs!.setString('City', cityName);
          Navigator.of(context).pushNamed('/${cityName}', arguments: cities[cityName],);
        },
      );
      drawerItems.add(tile);
    }
    return drawerItems;
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.orange,
      child: ListView(
        padding: EdgeInsets.zero,
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
