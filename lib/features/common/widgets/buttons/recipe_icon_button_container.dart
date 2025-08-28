import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';

class RecipeIconButtonContainer extends StatelessWidget {
  const RecipeIconButtonContainer({
    super.key,
    required this.icon,
    required this.callback,
    this.width = 28,
    this.height = 28,
    required this.iconW,
    required this.iconH,
    this.color = AppColors.pink,
    this.border = 14,
  });

  final String icon;
  final VoidCallback callback;
  final double width, height, iconW, iconH, border;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(border.sp),
      ),
      child: IconButton(
        onPressed: callback,
        icon: SvgPicture.asset(
          icon,
          width: iconW.w,
          height: iconH.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
