import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../datas/city_coord.dart';
import '../services/cookie_service.dart';
import 'bblj_scrollbehavior.dart';
import 'home.dart';

CupertinoNavigationBar navBar(BuildContext context, HomeState state) {
  var cc = CityCoord.fromJson(state.city!, cities[state.city]!.cast());
  return CupertinoNavigationBar(
    middle: Text(cc.cityName),
    trailing: IconButton(
      icon: const Icon(Icons.menu),
      tooltip: '開啟左側選單',
      onPressed: () {
        _showDialog(context, _picker(state));
      },
    ),
  );
}

void _showDialog(BuildContext context, Widget child) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}

const double _kItemExtent = 32.0;
Widget _picker(HomeState state) {
  var scroll = ScrollConfiguration(
    behavior: BBLJScrollBehavior(),
    child: CupertinoPicker(
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: _kItemExtent,
      // This sets the initial item.
      scrollController: FixedExtentScrollController(
        initialItem: cities[state.city]!["index"]! as int,
      ),
      // This is called when selected item is changed.
      onSelectedItemChanged: (int val) {
        state.changeCity(cityList[val]!["cityNameE"]);
      },
      children: List<Widget>.generate(cityList.length, (int i) {
        return Center(child: Text(cityList[i]!["cityName"]));
      }),
    ),
  );
  return scroll;
}
