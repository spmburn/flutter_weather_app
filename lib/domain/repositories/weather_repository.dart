import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<ForecastCurrent> getForecastCurrent(String query);
  Future<ForescastDay> getForecastDay(String query);
  Future<ForescastWeek> getForecastWeek(String query);
  Future<List<Location>> searchLocation(String query);
}
