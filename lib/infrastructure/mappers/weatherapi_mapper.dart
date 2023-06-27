import 'package:flutter_template/infrastructure/models/weatherapi/forecast_day_response.dart';
import 'package:flutter_template/infrastructure/models/weatherapi/search_response.dart';

import '../../domain/entities/weather.dart';
import '../models/weatherapi/current.dart';
import '../models/weatherapi/forecast_current_response.dart';
import '../models/weatherapi/location.dart';

class WeatherapiMapper {
  static ForecastCurrent weapiCurrentResponseToEntitie(WeatherapiCurrent weatherapiCurrent) {
    final WeatherapiLocation weatherapiLocation = weatherapiCurrent.location;
    return ForecastCurrent(
      location: weapiLocationToEntitie(weatherapiLocation),
      current: weapiCurrentToEntitie(weatherapiCurrent),
    );
  }

  static Location weapiLocationToEntitie(WeatherapiLocation weatherapiLocation) {
    return Location(
      name: weatherapiLocation.name,
      region: weatherapiLocation.region,
      country: weatherapiLocation.country,
      lat: weatherapiLocation.lat,
      lon: weatherapiLocation.lon,
    );
  }

  static Weather weapiCurrentToEntitie(WeatherapiCurrent weatherapiCurrent) {
    final Current current = weatherapiCurrent.current;
    return Weather(
      date: current.lastUpdated,
      tempC: current.tempC,
      description: current.condition.text,
      cloud: current.cloud,
      windKph: current.windKph,
      precipMm: current.precipMm.round(),
      humidity: current.humidity,
      icon: current.condition.icon.replaceAll("//", "https://"),
      code: current.condition.code.toString(),
    );
  }

  static ForescastDay weapiDayToEntitie(WeatherapiDay weatherapiDay) {
    return ForescastDay(
      location: weapiLocationToEntitie(weatherapiDay.location),
      day: weatherapiDay.forecast.forecastday[0].hour.map(
        (hour) {
          return Weather(
            date: hour.time,
            tempC: hour.tempC,
            description: hour.condition.text,
            cloud: hour.cloud,
            windKph: hour.windKph,
            precipMm: hour.precipMm.round(),
            humidity: hour.humidity,
            icon: hour.condition.icon.replaceAll("//", "https://"),
            code: hour.condition.code.toString(),
          );
        },
      ).toList(),
    );
  }

  static ForescastWeek weapiWeekToEntitie(WeatherapiDay weatherapiDay) {
    return ForescastWeek(
      location: weapiLocationToEntitie(weatherapiDay.location),
      week: weatherapiDay.forecast.forecastday.map(
        (fcday) {
          return Weather(
            date: fcday.date.toString(),
            tempC: fcday.day.maxtempC,
            mintempC: fcday.day.mintempC,
            description: fcday.day.condition.text,
            cloud: 0,
            windKph: fcday.day.maxwindKph,
            precipMm: fcday.day.totalprecipMm.round(),
            humidity: 0,
            icon: fcday.day.condition.icon.replaceAll("//", "https://"),
            code: fcday.day.condition.code.toString(),
          );
        },
      ).toList(),
    );
  }

  static Location weapiSearchToEntitie(SearchWeatherapi searchWeatherapi) {
    return Location(
      name: searchWeatherapi.name,
      region: searchWeatherapi.region,
      country: searchWeatherapi.country,
      lat: searchWeatherapi.lat,
      lon: searchWeatherapi.lon,
    );
  }
}
