import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/data/models/my_recipe_model.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button_container.dart';
import 'package:recipe_app/features/home/widgets/sections/home_your_recipe/home_your_recipe_bottom.dart';
import 'package:recipe_app/features/home/widgets/sections/home_your_recipe/home_your_recipe_top.dart';

class HomeYourRecipeItem extends StatelessWidget {
  const HomeYourRecipeItem({super.key, required this.recipes});

  final MyRecipeModel recipes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169.w,
      height: 195.h,
      child: Stack(
        children: [
          Align(alignment: Alignment.topCenter, child: HomeYourRecipeTop()),
          Align(
            alignment: Alignment.bottomCenter,
            child: HomeYourRecipeBottom(recipes: recipes),
          ),
          Positioned(
            top: 7.h,
            right: 7.h,
            child: RecipeIconButtonContainer(
              icon: "assets/icons/heart.svg",
              callback: () {},
              iconW: 16,
              iconH: 15,
              color: AppColors.redPinkMain,
              iconColor: AppColors.whiteBeige,
            ),
          ),
        ],
      ),
    );
  }
}
