import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
    );
  }

  // Background Color
  static const Color backgroundMagenta = Color(0xffE75481);
  static const Color backgroundLightGrey = Color(0xff929CDE);
  static const Color backgroundWhite = Color(0xffFFFFFF);

  // Colors Card

  static const Color cardWhite = Color(0xffFBFBFB);
  static const Color cardPurple = Color(0xff5E4FC1);
  static const Color cardCrimson = Color(0xffD4426F);
  static const Color cardBlueViolet = Color(0xff6A75BA);
  static const Color cardGoldenYellow = Color(0xffE9C939);
  static const Color cardLightBlue = Color(0xff658ED9);

  static const Color cardLightBlue2 = Color(0xff658ED9);
  static const Color cardPink = Color(0xffD86191);
  static const Color cardPurple2 = Color(0xff5E4FC1);
  static const Color cardColorGoldenYellow2 = Color(0xffE9C939);

  // Text Color
  static const Color textColorDarkBrown = Color(0xff332821);
  static const Color textColorPink = Color(0xffD86191);
  static const Color textColorPurple = Color(0xff5E4FC1);
  static const Color textColorLightBlue = Color(0xff658ED9);
  static const Color textColorWhite = Color(0xffFFFFFF);
  static const Color textColorGray = Color(0xffC4C4C4);

  // Button text style
  static TextStyle buttonTextStyle = GoogleFonts.alegreyaSans(
    color: AppTheme.textColorWhite,
    fontWeight: FontWeight.bold,
  );
  static TextStyle locationTextStyleLarge = GoogleFonts.alegreyaSans(
    color: AppTheme.textColorDarkBrown,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static TextStyle locationTextStyleMedium = GoogleFonts.alegreyaSans(
    color: AppTheme.textColorDarkBrown,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dateTextStyleMedium = GoogleFonts.montserrat(
    color: AppTheme.textColorDarkBrown.withOpacity(0.5),
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dateTextStyleLarge = GoogleFonts.montserrat(
    color: AppTheme.textColorDarkBrown,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
