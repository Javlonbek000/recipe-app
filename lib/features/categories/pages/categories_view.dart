import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/features/categories/manager/categories_bloc.dart';
import 'package:recipe_app/features/categories/manager/categories_state.dart';
import 'package:recipe_app/features/categories/pages/categories_main_item.dart';
import 'package:recipe_app/features/categories/pages/category_item.dart';
import 'package:recipe_app/features/common/widgets/recipe_navigation_bar.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(toolbarHeight: 90.h),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state.status == CategoriesStatus.success) {
            final mainCat = state.main!;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 10.h),
              child: Column(
                spacing: 10.h,
                children: [
                  CategoriesMainItem(mainCat: mainCat),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h,
                      mainAxisExtent: 180.h,
                      crossAxisSpacing: 30.w,
                    ),
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return CategoryItem(category: category);
                    },
                  ),
                ],
              ),
            );
          } else if (state.status == CategoriesStatus.error) {
            return Center(
              child: Text(
                state.errorMessage.toString(),
                style: AppStyle.fieldTitle,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: RecipeNavigationBar(),
    );
  }
}
