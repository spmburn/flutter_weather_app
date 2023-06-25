import 'package:flutter/material.dart';
import 'package:flutter_template/config/fonts/custom_icons_icons.dart';
import 'package:flutter_template/presentation/widgets/widgets.dart';

import '../../config/theme/app_theme.dart';

class DetailScren extends StatelessWidget {
  static const String name = 'detail_screen';
  const DetailScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppTheme.cardMagenta,
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            right: 10,
            top: 0,
            child: Image.asset(
              'assets/images/sun_ cloud_rain.png',
              scale: 0.6,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Berlin, Germany'.replaceAll(',', ',\n'),
                style: AppTheme.locationTextStyleLarge,
              ),
              const TemperatureWidget(
                temperaure: 13,
                fontSize: 96.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChipTextIconInfo(
                    text: '6%',
                    color: AppTheme.textColorLightBlue,
                    iconData: CustomIcons.precipitation,
                  ),
                  ChipTextIconInfo(
                    text: '90%',
                    color: AppTheme.textColorLightBlue,
                    iconData: CustomIcons.humidity,
                  ),
                  ChipTextIconInfo(
                    text: '19km/h',
                    color: AppTheme.textColorPurple,
                    iconData: CustomIcons.wind,
                  ),
                ],
              ),
              Text(
                'Today',
                style: AppTheme.locationTextStyleMedium,
              ),
              SizedBox(
                width: double.infinity,
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const CardInfoHour();
                  },
                ),
              ),
              const SizedBox(height: 10),
              _WeekView(),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeekView extends StatelessWidget {
  // _WeekView({super.key});

  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: daysOfWeek.length,
          itemBuilder: (BuildContext context, int index) {
            final day = daysOfWeek[index];
            return WeatherDayWidget(
              day: day,
              min: 13,
              max: 20,
              iconPath: 'assets/icons/cloud.png',
            );
          },
        ),
      ),
    );
  }
}
