import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/chef_model.dart';
import 'package:recipe_app/features/home/widgets/sections/home_top_chef/home_chef_item.dart';

class HomeTopChefSection extends StatelessWidget {
  const HomeTopChefSection({super.key, required this.chefs});

  final List<ChefModel> chefs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Chef", style: AppStyle.appbarTitle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(chefs.length, (index) {
              final chef = chefs[index];
              return HomeChefItem(chef: chef);
            }),
          ),
        ],
      ),
    );
  }
}
