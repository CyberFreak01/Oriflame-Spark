import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const oriflameGreen = Color(0xFF73BF98);
  static const oriflameGreenDark = Color(0xFF00725B);
  static const loadingGreenLight = Color(0xFF9CDABC);
  static const tabInactive = Color(0xFF595959);
  static const textDark = Color(0xFF2D2D2D);
  static const textHeading = Color(0xFF212328);
  static const textSubtle = Color(0xFF656B76);
  static const textFooter = Color(0xFF54565F);
  static const captionGray = Color(0xFF7B7676);
  static const radioEmpty = Color(0xFFD0D3DA);
  static const chipDark = Color(0xFF262928);
  static const referralGray = Color(0xFFCECECE);
  static const storyRingPink = Color(0xFFFF64EE);
  static const storyRingBlue = Color(0xFF75A5FF);

  static Color overlayDark(double opacity) => Color.fromRGBO(49, 49, 49, opacity);
  static Color overlayLight(double opacity) => Color.fromRGBO(187, 187, 187, opacity);
  static Color pillDark(double opacity) => Color.fromRGBO(70, 70, 70, opacity);
  static Color whiteFade(double opacity) => Color.fromRGBO(254, 254, 254, opacity);
}
