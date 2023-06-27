import 'package:flutter_template/domain/entities/weather.dart';

abstract class WeatherUsecase {
  Future<ForecastCurrent> getForecastCurrent(String query);
  Future<ForescastDay> getForecastDay(String query);
  Future<ForescastWeek> getForecastWeek(String query);
}
