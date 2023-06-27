import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/repositories/weather_repository_impl.dart';

final weatherRepositoryProvider = Provider<WeatherRepositoryImpl>((ref) {
  return WeatherRepositoryImpl();
});
