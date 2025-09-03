import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button.dart';

class RecipeNavigationBar extends StatefulWidget {
  const RecipeNavigationBar({super.key});

  @override
  State<RecipeNavigationBar> createState() => _RecipeNavigationBarState();
}

class _RecipeNavigationBarState extends State<RecipeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 75.w, right: 75.w, bottom: 36.h),
      child: Container(
        width: 281.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(33),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RecipeIconButton(
              icon: "assets/icons/home.svg",
              callback: () => context.go(Routes.home),
              width: 25,
              height: 22,
            ),
            RecipeIconButton(
              icon: "assets/icons/community.svg",
              callback: () {},
              width: 26,
              height: 26,
            ),
            RecipeIconButton(
              icon: "assets/icons/categories.svg",
              callback: () {
                context.go(Routes.categories);
              },
              width: 25,
              height: 23,
            ),
            RecipeIconButton(
              icon: "assets/icons/profile.svg",
              callback: () {},
              width: 15,
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}
