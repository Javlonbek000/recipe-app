import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';

class RecipeIconButton extends StatelessWidget {
  const RecipeIconButton({
    super.key,
    required this.icon,
    required this.callback,
    this.color = AppColors.textBrown,
    required this.width,
    required this.height,
  });

  final String icon;
  final VoidCallback callback;
  final Color color;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: SvgPicture.asset(
        icon,
        width: width.w,
        height: height.h,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
