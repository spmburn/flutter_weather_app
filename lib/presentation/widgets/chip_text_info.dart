import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class ChipTextInfo extends StatelessWidget {
  final String text;
  final Color color;

  const ChipTextInfo({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 2,
        bottom: 3,
      ),
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.alegreyaSans(
          color: AppTheme.textColorWhite,
          fontSize: 12,
        ),
      ),
    );
  }
}

class ChipTextIconInfo extends StatelessWidget {
  final String text;
  final Color color;
  final IconData iconData;

  const ChipTextIconInfo({
    super.key,
    required this.text,
    required this.color,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 5,
        bottom: 4,
      ),
      height: 34,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: color, size: 20),
          const SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.alegreyaSans(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
