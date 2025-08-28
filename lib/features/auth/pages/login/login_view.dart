import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/features/auth/managers/login/login_bloc.dart';
import 'package:recipe_app/features/auth/managers/login/login_state.dart';
import 'package:recipe_app/features/auth/pages/login/login_main_section.dart';

import 'login_sign_section.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        centerTitle: true,
        title: Text("login", style: AppStyle.appbarTitle),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            context.go(Routes.home);
          } else if (state.status == LoginStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage.toString())),
            );
          }
        },
        builder: (context, state) => SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 36.w,
            right: 36.w,
            top: 144.h,
            bottom: 10.h,
          ),
          child: Column(
            children: [
              LoginMainSection(formKey: formKey),
              SizedBox(height: 35.h),
              LoginSignSection(),
            ],
          ),
        ),
      ),
    );
  }
}
