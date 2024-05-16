import 'package:flutter/cupertino.dart';

List<Widget> hourlyInfos(List<Map<String, String>> hourly){
  List<Widget> his = [];
  for(int i = 0; i < hourly.length; i++){
    var hi = Column(
      children: <Widget>[
        SizedBox(
          width: 120.0,
          height: 120.0,
          child: Image.asset("${hourly[i]["iconUrl"]}", fit: BoxFit.fill),
        ),
        Text(hourly[i]["time"]!),
        Text("溫度:"+hourly[i]["temp"]!),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text("降雨:"+hourly[i]["pp"]!),
        )
      ],
    );
    his.add(hi);
  }
  return his;
}