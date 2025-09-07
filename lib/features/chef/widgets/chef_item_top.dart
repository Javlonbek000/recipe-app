import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/models/chef_model.dart';

class ChefItemTop extends StatelessWidget {
  const ChefItemTop({super.key, required this.chef});

  final ChefModel chef;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 170.w,
      height: 153.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.sp),
        boxShadow: [BoxShadow(offset: Offset(0, 4), blurRadius: 4)],
      ),
      child: Image.network(chef.profilePhoto, fit: BoxFit.cover),
    );
  }
}
