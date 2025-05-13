import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/helper/colors_app.dart';

class AppStyle {
  // Bold
  static TextStyle fontBoldSize32 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle fontBoldSize28 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle fontregularSize28 = GoogleFonts.pacifico(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle fontMediumSize28 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: Color(0xff0D1B2A),
  );
  static TextStyle fontExtraboldSize20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: ColorsApp.switchColor,
  );
  static TextStyle fontExtraboldSize14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );
  static TextStyle fontregularSize20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorsApp.switchColor,
  );
  static TextStyle fontregularSize20Gabriela = GoogleFonts.gabriela(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorsApp.switchColor,
  );
  static TextStyle fontMediumSize20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Color(0xff0D1B2A),
  );
  static TextStyle fontBoldSize15 = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle fontLightSize13 = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: Color(0xff2A6827),
  );
  static TextStyle fontLightSize11 = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: Color(0xff1B4332),
  );
  static TextStyle fontBoldSize10 = GoogleFonts.playfairDisplaySc(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
}

double getResponsiveSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();
  double scaledFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1;
  return scaledFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor() {
  var dispatcher = PlatformDispatcher.instance;
  double physicalWidth = dispatcher.views.first.physicalSize.width;
  double devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double width = physicalWidth / devicePixelRatio;
  return width / 300;
}
