import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/my_recipe_model.dart';
import 'package:recipe_app/features/home/widgets/sections/home_your_recipe/home_your_recipe_item.dart';

class HomeYourRecipe extends StatelessWidget {
  const HomeYourRecipe({super.key, required this.recipes});

  final List<MyRecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 255.h,
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Recipes", style: AppStyle.fieldTitle),
          Row(
            children: List.generate(recipes.length, (index) {
              return HomeYourRecipeItem(recipes: recipes[index]);
            }),
          ),
        ],
      ),
    );
  }
}
