import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:recipe_app/features/common/widgets/recipe_date_of_birth.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../common/widgets/text_form_feilds/recipe_form_field.dart';
import '../../../common/widgets/text_form_feilds/recipe_password_feild.dart';

class SignUpMainSection extends StatefulWidget {
  const SignUpMainSection({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.onDateSelect,
  });

  final TextEditingController name, email, phone, password;
  final void Function(String select) onDateSelect;

  @override
  State<SignUpMainSection> createState() => _SignUpMainSectionState();
}

class _SignUpMainSectionState extends State<SignUpMainSection> {
  final TextEditingController confirm = TextEditingController();
  DateTime? selectedDate;
  String select = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 402.w,
      height: 538.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RecipeFormField(
            titleBool: true,
            title: "Full Name",
            titleStyle: AppStyle.fieldTitle,
            hintText: "John Doe",
            hintStyle: AppStyle.hintStyle,
            width: 357.w,
            controller: widget.name,
            color: AppColors.pink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 36.sp),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Buni toldiring.";
              }
              return null;
            },
            boxConstraints: BoxConstraints(maxHeight: 50.h, minHeight: 41.h),
          ),
          RecipeFormField(
            titleBool: true,
            title: "Email",
            titleStyle: AppStyle.fieldTitle,
            hintText: "example@example.com",
            hintStyle: AppStyle.hintStyle,
            width: 357.w,
            controller: widget.email,
            color: AppColors.pink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 36.sp),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Buni toldiring.";
              }
              return null;
            },
            boxConstraints: BoxConstraints(maxHeight: 50.h, minHeight: 41.h),
          ),
          RecipeFormField(
            keyboardType: TextInputType.phone,
            titleBool: true,
            title: "Mobile Number",
            titleStyle: AppStyle.fieldTitle,
            hintText: "+ 123 456 789",
            hintStyle: AppStyle.hintStyle,
            width: 357.w,
            controller: widget.phone,
            color: AppColors.pink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 36.sp),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Buni toldiring.";
              }
              return null;
            },
            boxConstraints: BoxConstraints(maxHeight: 50.h, minHeight: 41.h),
          ),
          RecipeDateOfBirth(
            callback: () async {
              DateTime? picked = await showDatePicker(
                initialDate: selectedDate ?? DateTime(2000),
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                  select = DateFormat('yyyy-MM-dd').format(picked);
                });
                widget.onDateSelect(select);
              }
            },
            title: select.isEmpty ? "DD / MM /YYY" : select,
          ),
          RecipePasswordField(
            titleBool: true,
            title: "Password",
            titleStyle: AppStyle.fieldTitle,
            hintText: "● ● ● ● ● ● ● ●",
            hintStyle: AppStyle.hintStyle,
            width: 357.w,
            controller: widget.password,
            color: AppColors.pink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 36.sp),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Buni toldiring.";
              }
              return null;
            },
            boxConstraints: BoxConstraints(maxHeight: 50.h, minHeight: 41.h),
          ),
          RecipePasswordField(
            titleBool: true,
            title: "Confirm Password",
            titleStyle: AppStyle.fieldTitle,
            hintText: "● ● ● ● ● ● ● ●",
            hintStyle: AppStyle.hintStyle,
            width: 357.w,
            controller: confirm,
            color: AppColors.pink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 36.sp),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Buni toldiring.";
              } else if (value != widget.password.text) {
                return "Parollar bir xil emas!";
              }
              return null;
            },
            boxConstraints: BoxConstraints(maxHeight: 50.h, minHeight: 41.h),
          ),
        ],
      ),
    );
  }
}
