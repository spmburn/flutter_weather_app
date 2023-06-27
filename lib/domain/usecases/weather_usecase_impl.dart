import 'package:flutter_template/domain/entities/weather.dart';
import 'package:flutter_template/domain/repositories/weather_repository.dart';
import 'package:flutter_template/domain/usecases/weather_usecase.dart';

class WeatherUsecaseImpl extends WeatherUsecase {
  final WeatherRepository weatherRepository;

  WeatherUsecaseImpl(this.weatherRepository);
  @override
  Future<ForecastCurrent> getForecastCurrent(String query) {
    return weatherRepository.getForecastCurrent(query);
  }

  @override
  Future<ForescastDay> getForecastDay(String query) {
    return weatherRepository.getForecastDay(query);
  }

  @override
  Future<ForescastWeek> getForecastWeek(String query) {
    return weatherRepository.getForecastWeek(query);
  }
}
