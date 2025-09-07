import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/models/chef_model.dart';
import 'package:recipe_app/features/chef/widgets/chef_item.dart';

class ChefSecondSection extends StatelessWidget {
  const ChefSecondSection({super.key, required this.chefs});
  final List<ChefModel> chefs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 10.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 226.h,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
        itemCount: chefs.length,
        itemBuilder: (context, index) {
          final chef = chefs[index];
          return ChefItem(chef: chef);
        },
      ),
    );
  }
}
