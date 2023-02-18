import 'package:flutter_web/data/city_coord.dart';
import 'package:flutter_web/interface/i_cookie_service.dart';

import '../data/data.dart';

class CookieService implements ICookieService {

  @override
  CityCoord loadLastVisitedCity(){
    String? cityNameE = ICookieService.cookies!.getString("City");
    if(cityNameE == null){
      cityNameE = "Taipei";
    }
    Map<String, dynamic> cityJson = cities[cityNameE]!;
    CityCoord cc = CityCoord.fromJson(cityNameE, cityJson);
    return cc;
  }

  @override
  Future saveLastVisitedCity(CityCoord city) async {
    ICookieService.cookies!.setString("City", city.cityNameE);
  }

}