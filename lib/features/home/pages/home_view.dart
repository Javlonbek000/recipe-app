import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/features/home/widgets/home_actions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 106.h,
        leading: SizedBox(),
        leadingWidth: 36.w,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, 123", style: AppStyle.homeTitle),
            Text("What are you cooking today", style: AppStyle.homeSubTitle),
          ],
        ),
        actions: [HomeActions()],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 10.h),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              Text("Trending Recipe", style: AppStyle.appbarTitle),
              Stack(
                children: [

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
