import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/fonts/custom_icons_icons.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
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
            const AppBarWidget(),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Swiper(
                itemCount: 10,
                autoplay: false,
                scale: 0.7,
                viewportFraction: 0.7,
                itemBuilder: (BuildContext context, int index) {
                  return const CardInfoLocation();
                },
              ),
            ),
            const Column(
              children: [
                WeatherConditionWidget(
                  icon: CustomIcons.precipitation,
                  text: 'Precipitation',
                  value: '6%',
                ),
                WeatherConditionWidget(
                  icon: CustomIcons.humidity,
                  text: 'Humidity',
                  value: '90%',
                ),
                WeatherConditionWidget(
                  icon: CustomIcons.wind,
                  text: 'Wind',
                  value: '19km/h',
                ),
              ],
            ),
            const CustomNavbar()
          ],
        ),
      ),
      // bottomNavigationBar: CustomNavbar(),
    );
  }
}
