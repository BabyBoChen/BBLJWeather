abstract class IWeatherService {
  Future<Map<String, dynamic>> getWeather(String coord);
  String getWeatherIconUrlFromWeatherCode(String code, String dateTime, [String size = "2x"]);
  String getWeatherDescFromWeatherCode(String code, String dateTime);
}