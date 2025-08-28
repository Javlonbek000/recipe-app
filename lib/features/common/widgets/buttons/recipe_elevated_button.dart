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
  });

  final VoidCallback callback;
  final String title;
  final TextStyle textStyle;
  final Size size;
  final Color background, foreground;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        alignment: Alignment.center,
        fixedSize: size,
        foregroundColor: foreground,
      ),
      child: Text(title, style: textStyle),
    );
  }
}
