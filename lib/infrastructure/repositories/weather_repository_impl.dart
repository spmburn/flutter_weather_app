import 'package:dio/dio.dart';
import 'package:flutter_template/infrastructure/mappers/weatherapi_mapper.dart';
import 'package:flutter_template/infrastructure/models/weatherapi/forecast_day_response.dart';
import 'package:flutter_template/infrastructure/models/weatherapi/search_response.dart';

import '../../config/env/env.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../models/weatherapi/forecast_current_response.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://api.weatherapi.com/v1',
      queryParameters: {
        'key': Environment.weatherapiKey,
      },
    ),
  );

  @override
  Future<ForecastCurrent> getForecastCurrent(String query) async {
    final response = await _dio.get(
      '/current.json',
      queryParameters: {'q': query},
    );

    final weatherapiCurrent = WeatherapiCurrent.fromJson(response.data);
    final forecastCurrent = WeatherapiMapper.weapiCurrentResponseToEntitie(weatherapiCurrent);
    return forecastCurrent;
  }

  @override
  Future<ForescastDay> getForecastDay(String query) async {
    final response = await _dio.get(
      '/forecast.json',
      queryParameters: {
        'days': 1,
        'aqi': 'no',
        'alerts': 'no',
        'q': query,
      },
    );
    final weatherapiDay = WeatherapiDay.fromJson(response.data);
    final forecastDay = WeatherapiMapper.weapiDayToEntitie(weatherapiDay);
    return forecastDay;
  }

  @override
  Future<ForescastWeek> getForecastWeek(String query) async {
    final response = await _dio.get(
      '/forecast.json',
      queryParameters: {
        'days': 7,
        'aqi': 'no',
        'alerts': 'no',
        'q': query,
      },
    );
    final weatherapiWeek = WeatherapiDay.fromJson(response.data);
    final forecastWeek = WeatherapiMapper.weapiWeekToEntitie(weatherapiWeek);
    return forecastWeek;
  }

  @override
  Future<List<Location>> searchLocation(String query) async {
    final response = await _dio.get(
      '/search.json',
      queryParameters: {'q': query},
    );
    final List<dynamic> dataList = response.data;
    final locations = dataList.map((item) {
      final searchweatherapi = SearchWeatherapi.fromJson(item);
      return WeatherapiMapper.weapiSearchToEntitie(searchweatherapi);
    }).toList();

    return locations;
  }
}
