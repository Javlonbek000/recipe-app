import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/chef_model.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_elevated_button.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button_container.dart';

class ChefItemBottom extends StatelessWidget {
  const ChefItemBottom({super.key, required this.chef});

  final ChefModel chef;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 76.h,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: AppColors.whiteBeige,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(14.sp)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${chef.firstName} ${chef.lastName}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.yourRecipeTitle,
          ),
          Text(
            "@${chef.username}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.chefUsername,
          ),
          Spacer(),
          Row(
            spacing: 5.w,
            children: [
              Text(
                "0",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.timeStyle,
              ),
              SvgPicture.asset("assets/icons/star.svg"),
              Spacer(),
              RecipeElevatedButton(
                callback: () {},
                title: "Following",
                textStyle: AppStyle.followingStyle,
                size: Size(44.w, 14.h),
                padding: EdgeInsets.zero,
                background: AppColors.redPinkMain,
              ),
              RecipeIconButtonContainer(
                padding: EdgeInsets.zero,
                icon: "assets/icons/others.svg",
                callback: () {},
                iconW: 10,
                iconH: 10,
                width: 15,
                height: 15,
                color: AppColors.redPinkMain,
                iconColor: AppColors.whiteBeige,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
