import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/features/common/widgets/buttons/recipe_icon_button.dart';

import '../../../core/utils/colors.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBar({
    super.key,
    this.centerTitle = true,
    required this.title,
    this.toolbarHeight = 65,
    this.bottom,
    required this.actions,
  });

  final bool centerTitle;
  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height = bottomHeight == null
        ? toolbarHeight
        : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  bool canPop(BuildContext context) {
    return GoRouter.of(context).canPop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
      child: AppBar(
        toolbarHeight: toolbarHeight,
        leading: canPop(context)
            ? Align(
                alignment: Alignment.centerLeft,
                child: RecipeIconButton(
                  icon: "assets/icons/back_arrow.svg",
                  callback: () => context.pop(),
                  width: 30,
                  height: 14,
                  color: AppColors.redPinkMain,
                ),
              )
            : null,
        centerTitle: centerTitle,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions,
        bottom: bottom,
      ),
    );
  }
}
