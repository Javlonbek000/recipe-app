import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipePasswordField extends StatefulWidget {
  const RecipePasswordField({
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

  @override
  State<RecipePasswordField> createState() => _RecipePasswordFieldState();
}

class _RecipePasswordFieldState extends State<RecipePasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        widget.titleBool
            ? Text(widget.title, style: widget.titleStyle)
            : SizedBox(),
        SizedBox(
          width: widget.width,
          child: TextFormField(
            obscureText: obscure,
            obscuringCharacter: "●",
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0.2.h),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: SvgPicture.asset(
                  obscure
                      ? "assets/icons/hide_password.svg"
                      : "assets/icons/show_password.svg",
                  width: 24.5.w,
                  height: 19.5.h,
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ),
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              filled: true,
              fillColor: widget.color,
              border: widget.border,
              constraints: widget.boxConstraints,
              contentPadding: widget.contentPadding,
            ),
          ),
        ),
      ],
    );
  }
}
