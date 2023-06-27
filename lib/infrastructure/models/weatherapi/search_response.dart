class SearchWeatherapi {
  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;

  SearchWeatherapi({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory SearchWeatherapi.fromJson(Map<String, dynamic> json) => SearchWeatherapi(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "url": url,
      };
}
