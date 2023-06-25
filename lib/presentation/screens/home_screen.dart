// ignore_for_file: prefer_const_constructors

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
              AppTheme.cardMagenta,
              AppTheme.cardLightGrey,
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: CardInfo(),
                  );
                },
              ),
            ),
            const Column(
              children: [
                WeatherInfoWidget(
                  icon: CustomIcons.precipitation,
                  text: 'Precipitation',
                  value: '6%',
                ),
                WeatherInfoWidget(
                  icon: CustomIcons.humidity,
                  text: 'Humidity',
                  value: '90%',
                ),
                WeatherInfoWidget(
                  icon: CustomIcons.wind,
                  text: 'Wind',
                  value: '19km/h',
                ),
              ],
            ),
            CustomNavbar()
          ],
        ),
      ),
      // bottomNavigationBar: CustomNavbar(),
    );
  }
}

