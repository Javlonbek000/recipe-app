import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class RecipeElevatedButton extends StatelessWidget {
  const RecipeElevatedButton({
    super.key,
    required this.callback,
    required this.title,
    required this.textStyle,
    required this.size,
    this.background = AppColors.pink,
    this.foreground = AppColors.pinkSub,
    this.padding,
  });

  final VoidCallback callback;
  final String title;
  final TextStyle textStyle;
  final Size size;
  final Color background, foreground;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: background,
        alignment: Alignment.center,
        fixedSize: size,
        minimumSize: size,
        foregroundColor: foreground,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      child: Text(title, style: textStyle),
    );
  }
}
