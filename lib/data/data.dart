import 'dart:ui';

import 'package:flutter/material.dart';

var cities = {
  'Keelung':{
    'cityName' : '基隆市',
    'coord' : 'lat=25.1283&lon=121.7419',
    'district' : '仁愛區'
  },
  'Taipei':{
    'cityName' : '台北市(中山區)',
    'coord': 'lat=25.0478&lon=121.5319',
    'district' : '中山區'
  },
  'Guting':{
    'cityName' : '台北市(中正區)',
    'coord': 'lat=25.0333&lon=121.5166',
    'district' : '中正區'
  },
  'Banqiao':{
    'cityName' : '新北市(板橋區)',
    'coord': 'lat=25.0142&lon=121.4671',
    'district' : '板橋區'
  },
  'NewTaipei':{
    'cityName' : '新北市(新店區)',
    'coord': 'lat=24.947&lon=121.5817',
    'district' : '新店區'
  },
  'Taoyuan':{
    'cityName' : '桃園市',
    'coord': 'lat=24.9895&lon=121.3187',
    'district' : '桃園區'
  },
  'Hsinchu':{
    'cityName' : '新竹縣',
    'coord': 'lat=24.8383&lon=121.0077',
    'district' : '竹北市'
  },
  'HsinchuCity':{
    'cityName' : '新竹市',
    'coord': 'lat=24.8036&lon=120.9686',
    'district' : '東區'
  },
  'Miaoli':{
    'cityName' : '苗栗縣',
    'coord': 'lat=24.5642&lon=120.8236',
    'district' : '苗栗市'
  },
  'Taichung':{
    'cityName' : '台中市',
    'coord': 'lat=24.1469&lon=120.6838',
    'district' : '北區'
  },
  'Changhua':{
    'cityName' : '彰化縣',
    'coord': 'lat=24.0732&lon=120.5627',
    'district' : '彰化市'
  },
  'Nantou':{
    'cityName' : '南投縣',
    'coord': 'lat=23.9157&lon=120.6639',
    'district' : '南投市'
  },
  'Yunlin':{
    'cityName' : '雲林縣',
    'coord': 'lat=23.7094&lon=120.5433',
    'district' : '斗六市'
  },
  'ChiayiCity':{
    'cityName' : '嘉義市',
    'coord': 'lat=23.4791&lon=120.4488',
    'district' : '西區'
  },
  'Chiayi':{
    'cityName' : '嘉義縣',
    'coord': 'lat=23.4594&lon=120.3322',
    'district' : '太保市'
  },
  'Tainan':{
    'cityName' : '台南市',
    'coord': 'lat=23.0&lon=120.1887',
    'district' : '中西區'
  },
  'Kaohsiung':{
    'cityName' : '高雄市',
    'coord' : 'lat=22.6163&lon=120.3133',
    'district' : '前鎮區'
  },
  'Pingtung':{
    'cityName' : '屏東縣',
    'coord' : 'lat=22.6925&lon=120.4850',
    'district' : '屏東市'
  },
  'Yilan':{
    'cityName' : '宜蘭縣',
    'coord' : 'lat=24.757&lon=121.7529',
    'district' : '宜蘭市'
  },
  'Hualien':{
    'cityName' : '花蓮縣',
    'coord' : 'lat=23.9769&lon=121.6044',
    'district' : '花蓮市'
  },
  'Taitung':{
    'cityName' : '台東縣',
    'coord' : 'lat=22.7599&lon=121.1445',
    'district' : '台東市'
  },
};

Map<int, Color> themeColorMap = {
  50:Color.fromRGBO(118, 159, 205, .1),
  100:Color.fromRGBO(118, 159, 205, .2),
  200:Color.fromRGBO(118, 159, 205, .3),
  300:Color.fromRGBO(118, 159, 205, .4),
  400:Color.fromRGBO(118, 159, 205, .5),
  500:Color.fromRGBO(118, 159, 205, .6),
  600:Color.fromRGBO(118, 159, 205, .7),
  700:Color.fromRGBO(118, 159, 205, .8),
  800:Color.fromRGBO(118, 159, 205, .9),
  900:Color.fromRGBO(118, 159, 205, 1),
};

MaterialColor themeColor = MaterialColor(0xFF769FCD, themeColorMap);

Color primaryColor = const Color(0xff769fcd);
Color backgroundColor = const Color(0xffd6e6f2);
