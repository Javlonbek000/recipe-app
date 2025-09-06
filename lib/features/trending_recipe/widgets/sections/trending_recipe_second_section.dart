import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';
import 'package:recipe_app/features/trending_recipe/widgets/trending_recipe_item.dart';

class TrendingRecipeSecondSection extends StatelessWidget {
  const TrendingRecipeSecondSection({super.key, required this.recipes});

  final List<TrendingRecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return TrendingRecipeItem(recipe: recipe);
      },
    );
  }
}
