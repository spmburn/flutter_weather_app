import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/providers/weather_repository_provider.dart';

import '../../domain/entities/weather.dart';

final forecastCurrentProvider =
    FutureProvider.family<ForecastCurrent, String>((ref, location) async {
  final forecast = await ref.watch(weatherRepositoryProvider).getForecastCurrent(location);
  return forecast;
});

final forecastDayProvider = FutureProvider.family<ForescastDay, String>((ref, location) async {
  final forecast = await ref.watch(weatherRepositoryProvider).getForecastDay(location);
  return forecast;
});

final forecastWeekProvider = FutureProvider.family<ForescastWeek, String>((ref, location) async {
  final forecast = await ref.watch(weatherRepositoryProvider).getForecastWeek(location);
  return forecast;
});

final favoriteLocationsProvider = StateProvider<List<String>>((ref) {
  return [
    "Cartagena, Colombia",
    "Madrid",
    "La Paz, Bolivia",
    "Beijing, china",
    "Rovaniemi, Finlandia",
    "Lima",
  ];
});

final favoritesProvider = FutureProvider<List<ForecastCurrent>>((ref) async {
  final locations = ref.watch(favoriteLocationsProvider);
  List<ForecastCurrent> favorites = <ForecastCurrent>[];
  for (var location in locations) {
    final forecast = await ref.watch(weatherRepositoryProvider).getForecastCurrent(location);
    favorites.add(forecast);
  }
  return favorites;
});
