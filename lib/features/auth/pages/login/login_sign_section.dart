import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button.dart';

import '../../../../core/routing/routes.dart';

class LoginSignSection extends StatelessWidget {
  const LoginSignSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225.w,
      height: 197.h,
      child: Column(
        spacing: 20.h,
        children: [
          Text("Forgot Password?", style: AppStyle.textSpartan),
          Spacer(),
          Text("or sign up with", style: AppStyle.textSpartan),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RecipeIconButton(
                callback: () {},
                icon: "assets/icons/instagram.svg",
                width: 25.5,
                height: 27,
              ),
              RecipeIconButton(
                callback: () {},
                icon: "assets/icons/google.svg",
                width: 25.5,
                height: 27,
              ),
              RecipeIconButton(
                callback: () {},
                icon: "assets/icons/facebook.svg",
                width: 25.5,
                height: 27,
              ),
              RecipeIconButton(
                callback: () {},
                icon: "assets/icons/whats_up.svg",
                width: 25.5,
                height: 27,
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Don't have an account? ",
                  style: AppStyle.textSpartan,
                ),
                TextSpan(
                  text: "Sign Up",
                  style: AppStyle.textSpartanV2,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.go(Routes.signUp);
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
