import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/widgets/widgets.dart';

import '../../config/theme/app_theme.dart';

class WeatherDayWidget extends StatelessWidget {
  final String day;
  final double min;
  final double max;
  final String iconPath;

  const WeatherDayWidget({
    super.key,
    required this.day,
    required this.min,
    required this.max,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.3,
          child: Text(
            day,
            style: AppTheme.dateTextStyleLarge,
          ),
        ),
        // Image.asset(
        //   iconPath,
        //   height: 50,
        // ),
        Image.network(
          iconPath,
          height: 50,
        ),
        Row(
          children: [
            TemperatureWidget(
              temperaure: min,
              fontSize: 20,
              fontSizeUnits: 12,
              translateUnits: -1,
            ),
            const SizedBox(width: 10),
            TemperatureWidget(
              temperaure: max,
              fontSize: 20,
              fontSizeUnits: 12,
              translateUnits: -1,
              color: AppTheme.textColorDarkBrown.withOpacity(0.5),
            ),
          ],
        ),
      ],
    );
  }
}
