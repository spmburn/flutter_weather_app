import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String openweathermapKey = dotenv.env['openweathermapKey'] ?? 'No key';
  static String weatherapiKey = dotenv.env['weatherapiKey'] ?? 'No key';
}
