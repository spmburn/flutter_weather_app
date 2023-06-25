import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class TemperatureWidget extends StatelessWidget {
  final int temperaure;
  final String? date;
  final double fontSize;
  final double? fontSizeUnits;
  final double translateUnits;
  final Color color;

  const TemperatureWidget({
    super.key,
    required this.temperaure,
    this.date,
    this.fontSize = 64.0,
    this.fontSizeUnits,
    this.translateUnits = -10,
    this.color = AppTheme.textColorDarkBrown,
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
                color: color,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Transform.translate(
              offset: Offset(0, translateUnits),
              child: Text(
                'ºC',
                style: GoogleFonts.alegreyaSans(
                  color: color,
                  fontSize: fontSizeUnits ?? fontSize / 4,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        if (date != null)
          Transform.translate(
            offset: const Offset(0, -20),
            child: Text(
              date!,
              style: GoogleFonts.alegreyaSans(
                color: AppTheme.textColorDarkBrown.withOpacity(0.5),
                fontSize: fontSize / 4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
