import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

extension BuildContextX on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  TextTheme get textTheme => appTheme.textTheme;

  Size get screenSize => MediaQuery.of(this).size;

  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;
  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;
  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;
}

extension CustomTextTheme on TextTheme {
  TextStyle get latoBold65 => GoogleFonts.lato(
        fontSize: 65,
        fontWeight: FontWeight.bold,
      );

  TextStyle get latoMedium40 => GoogleFonts.lato(
        fontSize: 40,
        fontWeight: FontWeight.w500,
      );

  TextStyle get latoRegular130 => GoogleFonts.lato(
        fontSize: 130,
        fontWeight: FontWeight.normal,
      );
  TextStyle get latoRegular15 => GoogleFonts.lato(
        fontSize: 15.75,
        fontWeight: FontWeight.normal,
      );

  TextStyle get latoSemibold30 => GoogleFonts.lato(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      );

  TextStyle get latoMedium30 => GoogleFonts.lato(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      );

  TextStyle get latoSemibold14 => GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
}
