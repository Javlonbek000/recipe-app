import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button_container.dart';

class HomeActions extends StatelessWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        RecipeIconButtonContainer(
          icon: "assets/icons/notification.svg",
          iconW: 12,
          iconH: 18,
          callback: () {},
        ),
        RecipeIconButtonContainer(
          icon: "assets/icons/search.svg",
          iconW: 12,
          iconH: 18,
          callback: () {},
        ),
        SizedBox(width: 36.w),
      ],
    );
  }
}
