import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_elevated_button.dart';

import '../../../../core/utils/styles.dart';

class SignUpSignSection extends StatelessWidget {
  const SignUpSignSection({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 125.h,
      child: Column(
        spacing: 7.h,
        children: [
          Text(
            """By continuing, you agree to 
   Terms of Use and Privacy Policy.""",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppStyle.textSpartan,
          ),
          RecipeElevatedButton(
            callback: callback,
            title: "Sign Up",
            textStyle: AppStyle.buttonLabel,
            size: Size(194.w, 45.h),
            background: AppColors.redPinkMain,
            foreground: AppColors.whiteBeige,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account? ",
                  style: AppStyle.textSpartan,
                ),
                TextSpan(
                  text: "Log In",
                  style: AppStyle.textSpartanV2,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.go(Routes.login);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
