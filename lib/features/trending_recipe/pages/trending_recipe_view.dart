import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button_container.dart';
import 'package:recipe_app/features/common/widgets/recipe_app_bar.dart';
import 'package:recipe_app/features/common/widgets/recipe_navigation_bar.dart';
import 'package:recipe_app/features/trending_recipe/manager/trending_recipe_bloc.dart';
import 'package:recipe_app/features/trending_recipe/manager/trending_recipe_state.dart';
import 'package:recipe_app/features/trending_recipe/widgets/sections/trending_recipe_main_section.dart';
import 'package:recipe_app/features/trending_recipe/widgets/sections/trending_recipe_second_section.dart';

class TrendingRecipeView extends StatelessWidget {
  const TrendingRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        toolbarHeight: 90.h,
        title: "Trending Recipe",
        actions: [
          RecipeIconButtonContainer(
            icon: "assets/icons/notification.svg",
            callback: () {},
            iconW: 12,
            iconH: 17,
          ),
          SizedBox(width: 5.w),
          RecipeIconButtonContainer(
            icon: "assets/icons/search.svg",
            callback: () {},
            iconW: 12,
            iconH: 17,
          ),
        ],
      ),
      extendBody: true,
      body: BlocBuilder<TrendingRecipeBloc, TrendingRecipeState>(
        builder: (context, state) {
          if (state.status == TrendingRecipeStatus.success) {
            return Column(
              children: [
                TrendingRecipeMainSection(trend: state.trend),
                TrendingRecipeSecondSection(recipes: state.trendingRecipes),
              ],
            );
          } else if (state.status == TrendingRecipeStatus.error) {
            return Center(child: Text(state.errorMessage.toString()));
          }
          return Center(
            child: CircularProgressIndicator(color: AppColors.redPinkMain),
          );
        },
      ),
      bottomNavigationBar: RecipeNavigationBar(),
    );
  }
}
