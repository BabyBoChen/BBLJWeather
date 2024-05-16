class CityCoord {
  static CityCoord fromJson(String cityNameE, Map<String, dynamic> cityJson) {
    var cc = CityCoord();
    cc.cityNameE = cityNameE;
    cc.cityName = cityJson["cityName"];
    cc.coord = cityJson["coord"];
    cc.district = cityJson["district"];
    return cc;
  }

  String _cityNameE = "";
  String get cityNameE {
    return _cityNameE;
  }

  set cityNameE(String name) {
    _cityNameE = name;
  }

  String _cityName = "";
  String get cityName {
    return _cityName;
  }

  set cityName(String name) {
    _cityName = name;
  }

  String _coord = "";
  String get coord {
    return _coord;
  }

  set coord(String name) {
    _coord = name;
  }

  String _district = "";
  String get district {
    return _district;
  }

  set district(String dist) {
    _district = dist;
  }
}

var cities = {
  'Keelung':{
    'cityName' : '基隆市',
    'coord' : 'latitude=25.1283&longitude=121.7419',
    'district' : '仁愛區',
    "index": 0,
  },
  'Taipei':{
    'cityName' : '台北市(中山區)',
    'coord': 'latitude=25.0478&longitude=121.5319',
    'district' : '中山區',
    "index": 1,
  },
  'Guting':{
    'cityName' : '台北市(中正區)',
    'coord': 'latitude=25.0333&longitude=121.5166',
    'district' : '中正區',
    "index": 2,
  },
  'Banqiao':{
    'cityName' : '新北市(板橋區)',
    'coord': 'latitude=25.0142&longitude=121.4671',
    'district' : '板橋區',
    "index": 3,
  },
  'NewTaipei':{
    'cityName' : '新北市(新店區)',
    'coord': 'latitude=24.947&longitude=121.5817',
    'district' : '新店區',
    "index": 4,
  },
  'Taoyuan':{
    'cityName' : '桃園市',
    'coord': 'latitude=24.9895&longitude=121.3187',
    'district' : '桃園區',
    "index": 5,
  },
  'Hsinchu':{
    'cityName' : '新竹縣',
    'coord': 'latitude=24.8383&longitude=121.0077',
    'district' : '竹北市',
    "index": 6,
  },
  'HsinchuCity':{
    'cityName' : '新竹市',
    'coord': 'latitude=24.8036&longitude=120.9686',
    'district' : '東區',
    "index": 7,
  },
  'Miaoli':{
    'cityName' : '苗栗縣',
    'coord': 'latitude=24.5642&longitude=120.8236',
    'district' : '苗栗市',
    "index": 8,
  },
  'Taichung':{
    'cityName' : '台中市',
    'coord': 'latitude=24.1469&longitude=120.6838',
    'district' : '北區',
    "index": 9,
  },
  'Changhua':{
    'cityName' : '彰化縣',
    'coord': 'latitude=24.0732&longitude=120.5627',
    'district' : '彰化市',
    "index": 10,
  },
  'Nantou':{
    'cityName' : '南投縣',
    'coord': 'latitude=23.9157&longitude=120.6639',
    'district' : '南投市',
    "index": 11,
  },
  'Yunlin':{
    'cityName' : '雲林縣',
    'coord': 'latitude=23.7094&longitude=120.5433',
    'district' : '斗六市',
    "index": 12,
  },
  'ChiayiCity':{
    'cityName' : '嘉義市',
    'coord': 'latitude=23.4791&longitude=120.4488',
    'district' : '西區',
    "index": 13,
  },
  'Chiayi':{
    'cityName' : '嘉義縣',
    'coord': 'latitude=23.4594&longitude=120.3322',
    'district' : '太保市',
    "index": 14,
  },
  'Tainan':{
    'cityName' : '台南市',
    'coord': 'latitude=23.0&longitude=120.1887',
    'district' : '中西區',
    "index": 15,
  },
  'Kaohsiung':{
    'cityName' : '高雄市',
    'coord' : 'latitude=22.6163&longitude=120.3133',
    'district' : '前鎮區',
    "index": 16,
  },
  'Pingtung':{
    'cityName' : '屏東縣',
    'coord' : 'latitude=22.6925&longitude=120.4850',
    'district' : '屏東市',
    "index": 17,
  },
  'Yilan':{
    'cityName' : '宜蘭縣',
    'coord' : 'latitude=24.757&longitude=121.7529',
    'district' : '宜蘭市',
    "index": 18,
  },
  'Hualien':{
    'cityName' : '花蓮縣',
    'coord' : 'latitude=23.9769&longitude=121.6044',
    'district' : '花蓮市',
    "index": 19,
  },
  'Taitung':{
    'cityName' : '台東縣',
    'coord' : 'latitude=22.7599&longitude=121.1445',
    'district' : '台東市',
    "index": 20,
  },
};

var cityList = ((){
  var cl = [];
  for(var i = 0; i < 20; i++){
    cities.keys.forEach((k){
      if(cities[k]!["index"]! == i){
        var c = cities[k]!;
        c["cityNameE"] = k;
        cl.add(c);
        return;
      }
    });
  }
  return cl;
})();