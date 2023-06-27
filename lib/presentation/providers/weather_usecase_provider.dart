import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/weather_usecase_impl.dart';
import 'providers.dart';

final weatherUsecaseProvider = Provider<WeatherUsecaseImpl>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return WeatherUsecaseImpl(weatherRepository);
});
