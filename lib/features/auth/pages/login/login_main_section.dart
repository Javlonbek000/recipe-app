import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/features/auth/managers/login/login_bloc.dart';
import 'package:recipe_app/features/auth/managers/login/login_events.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_elevated_button.dart';
import 'package:recipe_app/features/common/widgets/text_form_feilds/recipe_form_field.dart';
import 'package:recipe_app/features/common/widgets/text_form_feilds/recipe_password_feild.dart';

class LoginMainSection extends StatefulWidget {
  const LoginMainSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<LoginMainSection> createState() => _LoginMainSectionState();
}

class _LoginMainSectionState extends State<LoginMainSection> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 357.w,
      height: 373.5.h,
      child: Form(
        key: widget.formKey,
        child: Column(
          spacing: 10.h,
          children: [
            RecipeFormField(
              titleBool: true,
              title: "Email",
              titleStyle: AppStyle.fieldTitle,
              hintText: "example@example.com",
              hintStyle: AppStyle.hintStyle,
              width: 357.w,
              controller: emailController,
              color: AppColors.pink,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.r),
              ),
              contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 36.sp),
              validator: (value) {
                return null;
              },
            ),
            RecipePasswordField(
              titleBool: true,
              title: "Password",
              titleStyle: AppStyle.fieldTitle,
              hintText: "● ● ● ● ● ● ● ●",
              hintStyle: AppStyle.hintStyle,
              width: 357.w,
              controller: passwordController,
              color: AppColors.pink,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.r),
              ),
              contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 36.sp),
              validator: (value) {
                return null;
              },
            ),
            Spacer(),
            RecipeElevatedButton(
              title: "Log In",
              size: Size(207.w, 45.h),
              callback: () {
                context.read<LoginBloc>().add(
                  LoginRequest(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                );
              },
              textStyle: AppStyle.buttonLabel,
            ),
            RecipeElevatedButton(
              title: "Sign Up",
              size: Size(207.w, 45.h),
              callback: () => context.go(Routes.signUp),
              textStyle: AppStyle.buttonLabel,
            ),
          ],
        ),
      ),
    );
  }
}
