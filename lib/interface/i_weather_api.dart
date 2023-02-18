abstract class IWeatherApi {
  Future<Map<String, dynamic>> getWeather(String coord);
}