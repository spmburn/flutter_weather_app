import 'package:flutter/material.dart';
import 'package:flutter_template/config/helpers/string_helper.dart';
import 'package:flutter_template/domain/entities/weather.dart';

import '../../config/theme/app_theme.dart';
import 'widgets.dart';

class CardInfoHour extends StatelessWidget {
  final Weather weather;
  const CardInfoHour({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 115,
      // color: Colors.red,
      child: Stack(
        alignment: const Alignment(0, 0.5),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppTheme.cardWhite,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            width: 90,
            height: 110,
          ),
          Positioned(
            bottom: 40,
            child: TemperatureWidget(
              temperaure: weather.tempC,
              fontSize: 40,
              fontSizeUnits: 18,
              translateUnits: -4,
            ),
          ),
          Positioned(
            bottom: 30,
            child: Text(
              StringHelper.getHour(weather.date),
              style: AppTheme.dateTextStyleMedium,
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              width: 70,
              height: 70,
              child: Image.network(
                weather.icon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned(
          //   top: -15,
          //   child: SizedBox(
          //     width: 85,
          //     height: 85,
          //     child: Image.asset(
          //       'assets/images/moon_cloud_fast_wind.png',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
