import 'package:flutter/cupertino.dart';

List<Widget> dailyInfos(List<Map<String, String>> daily) {
  List<Widget> dis = [];
  for (int i = 0; i < daily.length; i++) {
    String day = daily[i]["day"]!;
    String date = daily[i]["date"]!;
    String iconUrl = "${daily[i]["iconUrl"]}";
    String desc = daily[i]["desc"]!;
    String pp = daily[i]["pp"]!;
    String minTemp = daily[i]["minTemp"]!;
    String maxTemp = daily[i]["maxTemp"]!;
    var di = new Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      height: 55,
      child:  ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: Column(
              children: [
                Text(day),
                Text(date),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: Image.asset(iconUrl, fit: BoxFit.fill),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: [
                Text("${desc}(降雨: ${pp})"),
                Text("${minTemp}~${maxTemp}"),
              ],
            ),
          ),
        ],
      ),
    );

    dis.add(di);
  }
  return dis;
}
