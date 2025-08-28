import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppStyle {
  static final TextStyle fieldTitle = TextStyle(
    fontFamily: "Poppins",
    color: AppColors.textBrown,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle hintStyle = TextStyle(
    fontFamily: "Poppins",
    color: AppColors.beigeColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle buttonLabel = TextStyle(
    fontFamily: "Poppins",
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle textSpartan = TextStyle(
    fontFamily: "League Spartan",
    color: AppColors.textBrown,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle appbarTitle = TextStyle(
    fontFamily: "Poppins",
    color: AppColors.redPinkMain,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle textSpartanV2 = TextStyle(
    fontFamily: "League Spartan",
    color: AppColors.redPinkMain,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle homeTitle = TextStyle(
    color: AppColors.redPinkMain,
    fontFamily: "Poppins",
    fontSize: 25.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle homeSubTitle = TextStyle(
    color: AppColors.textBrown,
    fontFamily: "Poppins",
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
}
