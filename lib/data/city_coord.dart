class CityCoord {

  static CityCoord fromJson(String cityNameE, Map<String, dynamic> cityJson){
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