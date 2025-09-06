import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';
import 'package:recipe_app/features/home/widgets/sections/home_trending/home_trending_recipe_section.dart';

class TrendingRecipeMainSection extends StatelessWidget {
  const TrendingRecipeMainSection({super.key, this.trend});

  final TrendingRecipeModel? trend;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 241.h,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: HomeTrendingRecipeSection(model: trend, home: false),
    );
  }
}
