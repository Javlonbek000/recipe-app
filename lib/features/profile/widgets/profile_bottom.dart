import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/models/profile_model.dart';
import 'package:recipe_app/features/profile/widgets/profile_bottom_item.dart';

import '../../../core/utils/colors.dart';

class ProfileBottom extends StatelessWidget {
  const ProfileBottom({super.key, required this.profile});

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.beigeColor,
        borderRadius: BorderRadius.circular(14.sp),
        border: Border.all(width: 1, color: AppColors.pink),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileBottomItem(
            item: profile.recipesCount.toString(),
            subItem: 'recipes',
          ),
          Container(width: 1.w, height: double.infinity, color: AppColors.pink),
          ProfileBottomItem(
            item: profile.followingCount.toString(),
            subItem: 'following',
          ),
          Container(width: 1.w, height: double.infinity, color: AppColors.pink),
          ProfileBottomItem(
            item: profile.followerCount.toString(),
            subItem: 'followers',
          ),
        ],
      ),
    );
  }
}
