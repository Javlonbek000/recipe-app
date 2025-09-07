import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/models/chef_model.dart';
import 'package:recipe_app/features/chef/widgets/chef_item_bottom.dart';
import 'package:recipe_app/features/chef/widgets/chef_item_top.dart';

class ChefItem extends StatelessWidget {
  const ChefItem({super.key, required this.chef});

  final ChefModel chef;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.w,
      height: 225.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ChefItemBottom(chef: chef),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ChefItemTop(chef: chef),
          ),
        ],
      ),
    );
  }
}
