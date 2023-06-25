import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
    );
  }

  // Colors Card
  static const Color cardMagenta = Color(0xffE75481);
  static const Color cardLightGrey = Color(0xff929CDE);

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

  // Button text style
  static TextStyle buttonTextStyle = GoogleFonts.alegreyaSans(
    color: AppTheme.textColorWhite,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h2Semibold = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h3Semibold = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h4Semibold = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h5Semibold = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h6Semibold = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h7Semibold = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );

  // Heading text style Medium
  static TextStyle h1Medium = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h2Medium = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h3Medium = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h4Medium = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h5Medium = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h6Medium = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h7Medium = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );

  // Heading text style Regular
  static TextStyle h1Regular = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h2Regular = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h3Regular = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h4Regular = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h5Regular = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h6Regular = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h7Regular = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );

  // Paragraph TextStyle
  static TextStyle bodySemibold = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle bodyMedium = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle bodyRegular = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
}
