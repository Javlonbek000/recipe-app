import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class RecipeLoadingPage extends StatelessWidget {
  const RecipeLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: AppColors.redPinkMain),
      ),
    );
  }
}
