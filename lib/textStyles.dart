import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {

  //// primary purple medium text w500
  static final TextStyle primaryPurpleMediumText20 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: AppColors.primaryPurpleColor,
    fontSize: 18.sp,
  );
  static final TextStyle primaryPurpleMediumText11 =
      primaryPurpleMediumText20.copyWith(
    fontSize: 10.sp,
  );
  static final TextStyle primaryPurpleMediumText10 =
      primaryPurpleMediumText20.copyWith(
    fontSize: 9.sp,
  );
  static final TextStyle primaryPurpleMediumText8 =
      primaryPurpleMediumText20.copyWith(
    fontSize: 7.5.sp,
  );
  static final TextStyle primaryPurpleMediumText12 =
      primaryPurpleMediumText20.copyWith(
    fontSize: 11.2.sp,
  );


  //// primary purple bold text w700
  static final TextStyle primaryPurpleBoldText10 = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    color: AppColors.primaryPurpleColor,
    fontSize: 9.sp,
  );
  static final TextStyle primaryPurpleBoldText8 = 
      primaryPurpleBoldText10.copyWith(
        fontSize: 7.5.sp,
  );

  //// primary white bold text w700
  static final TextStyle primaryWhiteBoldText10 = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    color: AppColors.primaryWhiteColor,
    fontSize: 9.sp,
  );
  static final TextStyle primaryWhiteBoldText8 =
      primaryWhiteBoldText10.copyWith(
        fontSize: 7.5.sp,
  );
  static final TextStyle primaryWhiteBoldText12 =
      primaryWhiteBoldText10.copyWith(
        fontSize: 11.2.sp,
  );


  //// title black medium text w500
  static final TextStyle titleBlackMediumText20 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: AppColors.appBarTitleBlackColor,
    fontSize: 18.sp,
  );


  //// secondary blue-grey text w400
  static final TextStyle secondaryBlueGreyText11 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryBlueGreyColor,
    fontSize: 10.sp,
  );
  static final TextStyle secondaryBlueGreyText7 =
      secondaryBlueGreyText11.copyWith(
    color: AppColors.secondaryBlueGreyColor,
    fontSize: 6.5.sp,
  );


  //// grey text
  static final TextStyle greyText6 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.appBarTitleBlackColor,
    fontSize: 6.sp,
  );


  //// primary black medium text w500
  static final TextStyle primaryBlackMediumText18 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: AppColors.primaryBlackColor,
    fontSize: 16.5.sp,
  );


  //// secondary blue-grey-alt text w400
  static final TextStyle secondaryBlueGreyAltText11 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryBlueGreyColorAlt,
    fontSize: 10.sp,
  );


  //// secondary dark-cyan semi-bold text w600
  static final TextStyle secondaryDarkCyanSemiBoldText18 = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryDarkCyanColor,
    fontSize: 16.5.sp,
  );
}
