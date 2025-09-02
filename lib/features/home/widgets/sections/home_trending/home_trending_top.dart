import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';

class HomeTrendingTop extends StatelessWidget {
  const HomeTrendingTop({super.key, required this.model});

  final TrendingRecipeModel? model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.sp),
        child: Image.network(
          model!.photo,
          width: double.infinity.w,
          height: 143.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
