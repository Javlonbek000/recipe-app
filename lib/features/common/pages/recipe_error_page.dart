import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_elevated_button.dart';

class RecipeErrorPage extends StatelessWidget {
  const RecipeErrorPage({super.key, required this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RecipeElevatedButton(
          callback: () {
            context.go(Routes.login);
          },
          title: "Login",
          textStyle: AppStyle.buttonLabel,
          size: Size(200.w, 60.h),
        ),
      ),
      body: Center(child: Text(errorMessage.toString(), style: AppStyle.textSpartan)),
    );
  }
}
