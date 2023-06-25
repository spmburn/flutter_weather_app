import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';
import 'widgets.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Los Angeles, CA, USA',
                  style: GoogleFonts.alegreyaSans(
                    color: AppTheme.textColorDarkBrown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const TemperatureWidget(
                      temperaure: 15,
                      date: 'Sunday, 11 am',
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ChipTextInfo(
                          text: 'Strong winds',
                          color: AppTheme.cardCrimson.withOpacity(0.5),
                        ),
                        const SizedBox(height: 5),
                        ChipTextInfo(
                          text: 'Cloudy',
                          color: AppTheme.cardBlueViolet.withOpacity(0.5),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            child: CustomButton(),
          ),
          Positioned(
            top: -70,
            child: Image.asset('assets/moon_cloud_fast_wind.png'),
          ),
        ],
      ),
    );
  }
}
