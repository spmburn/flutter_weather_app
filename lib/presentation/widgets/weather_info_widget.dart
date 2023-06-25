import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class WeatherInfoWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;
  const WeatherInfoWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppTheme.textColorWhite,
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.alegreyaSans(
              color: AppTheme.textColorWhite,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.alegreyaSans(
              color: AppTheme.textColorWhite,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
