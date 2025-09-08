import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/common/pages/recipe_error_page.dart';
import 'package:recipe_app/features/common/pages/recipe_loading_page.dart';
import 'package:recipe_app/features/common/widgets/recipe_navigation_bar.dart';
import 'package:recipe_app/features/profile/manager/profile_bloc.dart';
import 'package:recipe_app/features/profile/manager/profile_state.dart';
import 'package:recipe_app/features/profile/widgets/profile_app_bar.dart';
import 'package:recipe_app/features/profile/widgets/profile_app_bar_bottom.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.status == ProfileStatus.success) {
          final profile = state.profile!;
          return Scaffold(
            appBar: ProfileAppBar(
              profile: state.profile,
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 83.h),
                child: ProfileAppBarBottom(profile: profile),
              ),
            ),
            bottomNavigationBar: RecipeNavigationBar(),
          );
        } else if (state.status == ProfileStatus.error) {
          return RecipeErrorPage(errorMessage: state.errorMessage);
        }
        return RecipeLoadingPage();
      },
    );
  }
}
