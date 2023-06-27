import '../../domain/entities/weather.dart';

final constantForecastCurrent = ForecastCurrent(
  location: Location(
    name: '',
    region: '',
    country: '',
    lat: 0,
    lon: 0,
  ),
  current: Weather(
    date: '',
    tempC: 0,
    mintempC: 0,
    description: '',
    cloud: 0,
    windKph: 0,
    precipMm: 0,
    humidity: 0,
    icon: '',
    code: '',
  ),
);
