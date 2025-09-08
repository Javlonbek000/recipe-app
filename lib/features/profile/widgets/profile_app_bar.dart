import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/styles.dart';
import 'package:recipe_app/data/models/profile_model.dart';
import '../../common/widgets/buttons/recipe_icon_button_container.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
    this.profile,
    this.toolbarHeight = 97,
    this.bottom,
  });

  final ProfileModel? profile;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height = bottomHeight == null
        ? toolbarHeight
        : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 5.h),
      child: AppBar(
        leading: profile!.profilePhoto == null
            ? RecipeIconButtonContainer(
                icon: "assets/icons/plus.svg",
                callback: () {},
                iconW: 30,
                iconH: 30,
                width: 102,
                height: 97,
                border: 50,
              )
            : Image.network(profile!.profilePhoto!),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${profile!.firstName} ${profile!.lastName}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.profileName,
            ),
            Text(
              "@${profile!.username}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.timeStyle,
            ),
            Text(
              "${profile!.presentation}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.trendingSubTitle,
            ),
          ],
        ),
        actions: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              spacing: 5.w,
              children: [
                RecipeIconButtonContainer(
                  icon: "assets/icons/plus.svg",
                  callback: () {},
                  iconW: 12,
                  iconH: 12,
                ),
                RecipeIconButtonContainer(
                  icon: "assets/icons/menu.svg",
                  callback: () {},
                  iconW: 12,
                  iconH: 10,
                ),
              ],
            ),
          ),
        ],
        bottom: bottom,
      ),
    );
  }
}
