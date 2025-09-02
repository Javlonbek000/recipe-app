import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/chef_model.dart';

class HomeChefItem extends StatelessWidget {
  const HomeChefItem({super.key, required this.chef});

  final ChefModel chef;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7.sp),
          child: Image.network(
            chef.profilePhoto,
            width: 83.w,
            height: 74.h,
            fit: BoxFit.cover,
          ),
        ),
        Text(chef.firstName, style: AppStyle.homeChefName),
      ],
    );
  }
}
