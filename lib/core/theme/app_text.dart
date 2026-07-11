import 'package:flutter/material.dart';
import 'app_fonts.dart';
import 'app_colors.dart';

class AppText {
  AppText._();
  static const TextStyle tabActive = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 21 / 14,
    color: AppColors.oriflameGreen,
  );
  static const TextStyle tabInactive = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 21 / 14,
    color: AppColors.tabInactive,
  );
  static const TextStyle captionSmallGray = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 15 / 10,
    color: AppColors.captionGray,
  );
  static const TextStyle readyPill = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 18 / 12,
    color: Colors.white,
  );
  static const TextStyle communityLine = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 18 / 12,
    color: Colors.white,
  );
  static const TextStyle quickShareLabel = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 18 / 12,
    color: Colors.white,
  );
  static const TextStyle productName = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 21 / 14,
    color: Colors.white,
  );
  static const TextStyle productPrice = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 18 / 12,
    color: Colors.white,
  );
  static const TextStyle discountBadge = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 10,
    height: 15 / 10,
    color: Colors.white,
  );
  static const TextStyle songLabel = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 10,
    height: 15 / 10,
    color: Colors.white,
  );
  static const TextStyle songName = TextStyle(
    fontFamily: AppFonts.body,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 18 / 12,
    color: Colors.white,
  );
  static const TextStyle captionBody = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 17 / 12,
    color: Colors.white,
  );
  static const TextStyle captionSeeMore = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 17 / 12,
    color: Colors.white,
    decoration: TextDecoration.underline,
  );
  static const TextStyle referralText = TextStyle(
    fontFamily: AppFonts.body,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 17 / 12,
    color: AppColors.referralGray,
  );
  static const TextStyle pageCounter = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 10,
    height: 15 / 10,
    color: Colors.white,
  );
  static const TextStyle editCaptionTitle = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 30 / 20,
    color: AppColors.textDark,
  );
  static const TextStyle saveButton = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 21 / 14,
    color: Colors.white,
  );
  static const TextStyle editCaptionBody = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: AppColors.textDark,
  );
  static const TextStyle loadingHeading = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 30 / 20,
    color: AppColors.textHeading,
  );
  static const TextStyle loadingItemActive = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 21 / 14,
    color: AppColors.textHeading,
  );
  static const TextStyle loadingItemPending = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: AppColors.textSubtle,
  );
  static const TextStyle loadingAllSet = TextStyle(
    fontFamily: AppFonts.body,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 24 / 16,
    color: AppColors.textFooter,
  );
}
