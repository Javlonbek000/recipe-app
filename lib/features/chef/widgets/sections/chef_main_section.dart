import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/chef_model.dart';
import 'package:recipe_app/features/chef/widgets/chef_item.dart';

class ChefMainSection extends StatelessWidget {
  const ChefMainSection({super.key, required this.chefs});
  final List<ChefModel> chefs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 285.h,
      padding: EdgeInsets.only(left: 36.w, right: 36.w, bottom: 18.h, top: 9.h),
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Most Viewed Chefs", style: AppStyle.fieldTitle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(2, (index) {
              final chef = chefs[index];
              return ChefItem(chef: chef);
            }),
          ),
        ],
      ),
    );
  }
}
