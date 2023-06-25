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
      height: 18,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.alegreyaSans(
          color: AppTheme.textColorWhite,
          fontSize: 10,
        ),
      ),
    );
  }
}
