import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/my_recipe_model.dart';

class HomeYourRecipeBottom extends StatelessWidget {
  const HomeYourRecipeBottom({super.key, required this.recipes});

  final MyRecipeModel recipes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169.w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.whiteBeige,
        borderRadius: BorderRadius.circular(13.sp),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withValues(alpha: 0.4),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              recipes.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.yourRecipeTitle,
            ),
          ),
          Row(
            spacing: 5.w,
            children: [
              Text(recipes.rating.toString(), style: AppStyle.timeStyle),
              SvgPicture.asset("assets/icons/star.svg"),
              SizedBox(width: 10.w),
              Text(
                recipes.timeRequired.toString(),
                style: AppStyle.timeStyle,
              ),
              SvgPicture.asset("assets/icons/clock.svg"),
            ],
          ),
        ],
      ),
    );
  }
}
