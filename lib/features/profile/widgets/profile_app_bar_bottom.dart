import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/models/profile_model.dart';
import 'package:recipe_app/features/profile/widgets/profile_bottom.dart';

import '../../../core/utils/styles.dart';
import '../../common/widgets/buttons/recipe_elevated_button.dart';

class ProfileAppBarBottom extends StatelessWidget {
  const ProfileAppBarBottom({super.key, required this.profile});

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RecipeElevatedButton(
              callback: () {},
              title: "Edit Profile",
              textStyle: AppStyle.profileName,
              size: Size(175.w, 27.h),
            ),
            RecipeElevatedButton(
              callback: () {},
              title: "Share Profile",
              textStyle: AppStyle.profileName,
              size: Size(175.w, 27.h),
            ),
          ],
        ),
        ProfileBottom(profile: profile),
      ],
    );
  }
}
