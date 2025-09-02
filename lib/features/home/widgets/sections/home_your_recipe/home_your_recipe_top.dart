import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeYourRecipeTop extends StatelessWidget {
  const HomeYourRecipeTop({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.sp),
      child: Image.asset(
        "assets/images/launch.png",
        width: 169.w,
        height: 162.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
