import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/features/chef/manager/chef_bloc.dart';
import 'package:recipe_app/features/chef/manager/chef_state.dart';
import 'package:recipe_app/features/chef/widgets/sections/chef_main_section.dart';
import 'package:recipe_app/features/chef/widgets/sections/chef_second_section.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button_container.dart';
import 'package:recipe_app/features/common/widgets/recipe_app_bar.dart';
import 'package:recipe_app/features/common/widgets/recipe_navigation_bar.dart';

class ChefView extends StatelessWidget {
  const ChefView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        title: "Top Chef",
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
      body: BlocBuilder<ChefBloc, ChefState>(
        builder: (context, state) {
          if (state.status == ChefStatus.success) {
            return Column(
              children: [
                ChefMainSection(chefs: state.chefs),
                ChefSecondSection(chefs: state.chefs),
              ],
            );
          } else if (state.status == ChefStatus.error) {
            return Center(
              child: Text(
                state.errorMessage.toString(),
                style: AppStyle.textSpartan,
              ),
            );
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
