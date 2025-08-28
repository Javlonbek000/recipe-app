import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/utils/colors.dart';

import '../../../core/routing/routes.dart';
import '../../../core/secure_storage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final firstTime = await SecureStorage.isFirstTime();

    final token = await SecureStorage.getToken();

    if (!mounted) return;

    if (firstTime) {
      await SecureStorage.setFirstTime(false);
      context.go(Routes.login);
    } else if (token != null && token.isNotEmpty) {
      context.go(Routes.home);
    } else {
      context.go(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redPinkMain,
      body: Center(
        child: Image.asset(
          "assets/images/launch.png",
          width: 207.w,
          height: 252.h,
        ),
      ),
    );
  }
}
