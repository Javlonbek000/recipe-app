import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_elevated_button.dart';
import 'package:recipe_app/features/home/manager/home_bloc.dart';
import 'package:recipe_app/features/home/manager/home_state.dart';
import 'package:recipe_app/features/common/widgets/recipe_navigation_bar.dart';
import 'package:recipe_app/features/home/widgets/home_actions.dart';
import 'package:recipe_app/features/home/widgets/sections/home_top_chef/home_top_chef_section.dart';
import 'package:recipe_app/features/home/widgets/sections/home_trending/home_trending_recipe_section.dart';
import 'package:recipe_app/features/home/widgets/sections/home_your_recipe/home_your_recipe_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.success) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 106.h,
              leading: SizedBox(),
              leadingWidth: 36.w,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi, ${state.profile!.username}", style: AppStyle.homeTitle),
                  Text(
                    "What are you cooking today",
                    style: AppStyle.homeSubTitle,
                  ),
                ],
              ),
              actions: [HomeActions()],
            ),
            extendBody: true,
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              children: [
                HomeTrendingRecipeSection(model: state.trendingRecipe),
                SizedBox(height: 20.h),
                HomeYourRecipe(recipes: state.myRecipes),
                SizedBox(height: 20.h),
                HomeTopChefSection(chefs: state.chefs),
              ],
            ),
            bottomNavigationBar: RecipeNavigationBar(),
          );
        } else if (state.status == HomeStatus.error) {
          return Scaffold(
            appBar: AppBar(
              title: RecipeElevatedButton(
                callback: () {
                  context.go(Routes.login);
                },
                title: "Login",
                textStyle: AppStyle.buttonLabel,
                size: Size(200.w, 60.h),
              ),
            ),
            body: Center(
              child: Text(
                state.errorMessage.toString(),
                style: AppStyle.textSpartan,
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
