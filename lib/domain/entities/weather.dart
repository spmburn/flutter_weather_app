class Weather {
  final String date;
  final double tempC;
  final String description;
  final int cloud;
  final double windKph;
  final int precipMm;
  final int humidity;
  final String icon;
  final String code;
  final double? mintempC;

  Weather({
    required this.date,
    required this.tempC,
    required this.description,
    required this.cloud,
    required this.windKph,
    required this.precipMm,
    required this.humidity,
    required this.icon,
    required this.code,
    this.mintempC,
  });
}

class ForecastCurrent {
  final Location location;
  final Weather current;
  ForecastCurrent({
    required this.location,
    required this.current,
  });
}

class ForescastDay {
  final Location location;
  final List<Weather> day;

  ForescastDay({
    required this.location,
    required this.day,
  });
}

class ForescastWeek {
  final Location location;
  final List<Weather> week;

  ForescastWeek({
    required this.location,
    required this.week,
  });
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
  });
}
