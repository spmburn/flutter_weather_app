import 'package:flutter_template/infrastructure/models/weatherapi/current.dart';
import 'package:flutter_template/infrastructure/models/weatherapi/location.dart';

class WeatherapiCurrent {
    final WeatherapiLocation location;
    final Current current;

    WeatherapiCurrent({
        required this.location,
        required this.current,
    });

    factory WeatherapiCurrent.fromJson(Map<String, dynamic> json) => WeatherapiCurrent(
        location: WeatherapiLocation.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
    };
}



