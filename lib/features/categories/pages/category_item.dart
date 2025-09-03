import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13.sp),
          child: Image.network(
            category.image,
            width: 159.w,
            height: 145.h,
            fit: BoxFit.cover,
          ),
        ),
        Text(category.title, style: AppStyle.fieldTitle),
      ],
    );
  }
}
