import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/drawer_item.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItem(
          icon: AppIcons.settingsIcon,
          text: 'Settings',
        ),
        const SizedBox(height: 20),
        DrawerItem(
          icon: AppIcons.supportIcon,
          text: 'Support',
        ),
        const SizedBox(height: 450),
        GestureDetector(
          onTap: () {},
          child: DrawerItem(
            icon: AppIcons.signOutIcon,
            text: 'Sign Out',
          ),
        ),
      ],
    );
  }
}
