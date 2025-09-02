import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';

class HomeTrendingBottom extends StatelessWidget {
  const HomeTrendingBottom({super.key, required this.model});

  final TrendingRecipeModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.h, right: 15.w, left: 15.w),
      width: 348.w,
      height: 53.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14.sp),
          bottomRight: Radius.circular(14.sp),
        ),
        border: Border.all(width: 1.w, color: AppColors.pinkSub),
      ),
      child: Column(
        children: [
          Row(
            spacing: 5.w,
            children: [
              SizedBox(
                width: 245.w,
                child: Text(
                  model!.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.homeSubTitle,
                ),
              ),
              Spacer(),
              SvgPicture.asset("assets/icons/clock.svg"),
              Text(
                "${model!.timeRequired}min",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.timeStyle,
              ),
            ],
          ),
          Row(
            spacing: 5.w,
            children: [
              SizedBox(
                width: 245.w,
                child: Text(
                  model!.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.trendingSubTitle,
                ),
              ),
              Spacer(),
              Text(model!.rating.toString(), style: AppStyle.timeStyle),
              SvgPicture.asset("assets/icons/star.svg"),
            ],
          ),
        ],
      ),
    );
  }
}
