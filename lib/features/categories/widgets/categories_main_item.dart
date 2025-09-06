import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/category_model.dart';

class CategoriesMainItem extends StatelessWidget {
  const CategoriesMainItem({super.key, required this.mainCat});

  final CategoryModel mainCat;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Text(mainCat.title, style: AppStyle.fieldTitle),
        ClipRRect(
          borderRadius: BorderRadius.circular(13.sp),
          child: Image.network(
            mainCat.image,
            width: double.infinity,
            height: 149.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
