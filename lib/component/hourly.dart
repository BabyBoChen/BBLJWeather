import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Hourly extends StatelessWidget {

  final List<dynamic> hourly;

  const Hourly({ Key? key, required this.hourly,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var percentageFormat = NumberFormat("##0");

    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, i ) {
          String pop = percentageFormat.format(hourly[i]['pop']*100)+'%';
          var iconUrl = 'https://openweathermap.org/img/wn/${hourly[i]['weather'][0]['icon']}@2x.png';
          var offsetSec = hourly[i]['dt'];
          DateTime dt = DateTime.fromMillisecondsSinceEpoch(offsetSec * 1000);
          var hour = Column(
            children: <Widget>[
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Image.network(iconUrl,fit: BoxFit.fill),
              ),
              Container(
                child: Text(dt.hour.toString()+":00"),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right:5.0),
                    child: Text('溫度:'),
                  ),
                  Container(
                    child: Text(hourly[i]['temp'].toString()),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right:5.0),
                    child: Text('降雨:'),
                  ),
                  Container(
                    child: Text(pop),
                  ),
                ],
              ),
            ],
          );
          return hour;
        },
      ),
    );

  }

}
