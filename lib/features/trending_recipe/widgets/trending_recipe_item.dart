import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button_container.dart';

class TrendingRecipeItem extends StatelessWidget {
  const TrendingRecipeItem({super.key, required this.recipe});

  final TrendingRecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.sp),
              child: Image.network(
                recipe.photo,
                width: 151.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 7.h,
              right: 8.w,
              child: RecipeIconButtonContainer(
                icon: "assets/icons/heart.svg",
                callback: () {},
                iconW: 16,
                iconH: 15,
              ),
            ),
          ],
        ),
        Container(
          width: 207.w,
          height: 122.h,
          decoration: BoxDecoration(
            color: AppColors.whiteBeige,
            border: Border.all(width: 1, color: AppColors.pink),
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(14.sp),
            ),
          ),
          child: Column(),
        ),
      ],
    );
  }
}
