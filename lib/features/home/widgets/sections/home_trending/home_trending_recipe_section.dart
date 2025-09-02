import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button_container.dart';
import 'package:recipe_app/features/home/widgets/sections/home_trending/home_trending_bottom.dart';
import 'package:recipe_app/features/home/widgets/sections/home_trending/home_trending_top.dart';

class HomeTrendingRecipeSection extends StatelessWidget {
  const HomeTrendingRecipeSection({super.key, required this.model});

  final TrendingRecipeModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text("Trending Recipe", style: AppStyle.appbarTitle),
          SizedBox(
            height: 182.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: HomeTrendingBottom(model: model),
                ),
                HomeTrendingTop(model: model),
                Positioned(
                  top: 7.h,
                  right: 7.w,
                  child: RecipeIconButtonContainer(
                    icon: "assets/icons/heart.svg",
                    callback: () {},
                    iconW: 16,
                    iconH: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
