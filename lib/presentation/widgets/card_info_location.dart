import 'package:flutter/material.dart';
import 'package:flutter_template/config/helpers/cloud_helper.dart';

import '../../config/helpers/string_helper.dart';
import '../../config/theme/app_theme.dart';
import '../../domain/entities/weather.dart';
import '../screens/screens.dart';
import 'widgets.dart';

class CardInfoLocation extends StatelessWidget {
  final ForecastCurrent forecast;
  const CardInfoLocation({
    super.key,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 230,
      // color: Colors.red,
      child: Stack(
        alignment: const Alignment(0, 0.7),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppTheme.cardWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            // width: 230,
            height: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  '${forecast.location.name}, ${forecast.location.country}',
                  style: AppTheme.locationTextStyleMedium,
                ),
                Row(
                  children: [
                    TemperatureWidget(
                      temperaure: forecast.current.tempC,
                      date: StringHelper.formatDateTime(forecast.current.date),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ChipTextInfo(
                          text: StringHelper.elipsis(forecast.current.description, 10),
                          color: AppTheme.cardCrimson.withOpacity(0.5),
                        ),
                        const SizedBox(height: 5),
                        ChipTextInfo(
                          text: CloudHelper.getCloudName(forecast.current.cloud),
                          color: AppTheme.cardBlueViolet.withOpacity(0.5),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomButton(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScren(
                    location: "${forecast.location.name}, ${forecast.location.country}",
                  ),
                ),
              ),
            ),
          ),
          // TODO: Implement custom icon
          Positioned(
            top: -70,
            child: Image.asset('assets/images/moon_cloud_fast_wind.png'),
          ),
        ],
      ),
    );
  }
}
