import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class ProfileBottomItem extends StatelessWidget {
  const ProfileBottomItem({
    super.key,
    required this.item,
    required this.subItem,
  });

  final String item, subItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item, style: AppStyle.homeChefName),
        Text(subItem, style: AppStyle.homeChefName),
      ],
    );
  }
}
