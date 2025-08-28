import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class RecipeDateOfBirth extends StatelessWidget {
  const RecipeDateOfBirth({
    super.key,
    required this.callback,
    required this.title,
  });

  final VoidCallback callback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text("Date Of Birth", style: AppStyle.fieldTitle),
        GestureDetector(
          onTap: callback,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 8.h),
            width: 357.w,
            height: 41.h,
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(18.sp),
            ),
            child: Text(title, style: AppStyle.hintStyle),
          ),
        ),
      ],
    );
  }
}
