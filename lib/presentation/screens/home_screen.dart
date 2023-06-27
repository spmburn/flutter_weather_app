import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/config/fonts/custom_icons_icons.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/domain/entities/weather.dart';
import 'package:flutter_template/presentation/providers/weather_provider.dart';

import '../widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(favoritesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final favoritesAsync = ref.watch(favoritesProvider);

    return favoritesAsync.when(
      error: (error, stackTrace) => const ErrorScreen(),
      loading: () => const LoadingScreen(),
      data: (favorites) => _HomeView(favorites: favorites),
    );
  }
}

class _HomeView extends StatelessWidget {
  final List<ForecastCurrent> favorites;
  const _HomeView({
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.backgroundMagenta,
              AppTheme.backgroundLightGrey,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppBarWidget(),
            ),
            SizedBox(
              width: double.infinity,
              height: 600,
              child: Swiper(
                itemCount: favorites.length,
                autoplay: false,
                scale: 0.4,
                viewportFraction: 0.6,
                itemBuilder: (BuildContext context, int index) {
                  final forecast = favorites[index];
                  return Column(
                    children: [
                      CardInfoLocation(forecast: forecast),
                      const SizedBox(height: 30),
                      WeatherConditionWidget(
                        icon: CustomIcons.precipitation,
                        text: 'Precipitation',
                        value: '${forecast.current.precipMm}mm',
                      ),
                      WeatherConditionWidget(
                        icon: CustomIcons.humidity,
                        text: 'Humidity',
                        value: '${forecast.current.humidity}%',
                      ),
                      WeatherConditionWidget(
                        icon: CustomIcons.wind,
                        text: 'Wind',
                        value: '${forecast.current.windKph} km/h',
                      ),
                    ],
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomNavbar(),
            )
          ],
        ),
      ),
    );
  }
}
