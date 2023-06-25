import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class TemperatureWidget extends StatelessWidget {
  final int temperaure;
  final String date;
  const TemperatureWidget({
    super.key,
    required this.temperaure,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$temperaure',
              style: GoogleFonts.alegreyaSans(
                color: AppTheme.textColorDarkBrown,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -10),
              child: Text(
                'ºC',
                style: GoogleFonts.alegreyaSans(
                  color: AppTheme.textColorDarkBrown,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: const Offset(0, -20),
          child: Text(
            date,
            style: GoogleFonts.alegreyaSans(
              color: AppTheme.textColorDarkBrown.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
