import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeFormField extends StatelessWidget {
  const RecipeFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.title = "",
    this.titleStyle,
    this.titleBool = false,
    required this.color,
    this.hintText,
    this.hintStyle,
    this.boxConstraints,
    required this.width,
    this.contentPadding,
    this.border,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String? Function(String? value) validator;
  final String title;
  final TextStyle? titleStyle, hintStyle;
  final bool titleBool;
  final Color? color;
  final String? hintText;
  final BoxConstraints? boxConstraints;
  final double width;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        titleBool ? Text(title, style: titleStyle) : SizedBox(),
        SizedBox(
          width: width,
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0.2.h),
              hintText: hintText,
              hintStyle: hintStyle,
              filled: true,
              fillColor: color,
              border: border,
              constraints: boxConstraints,
              contentPadding: contentPadding,
            ),
          ),
        ),
      ],
    );
  }
}
