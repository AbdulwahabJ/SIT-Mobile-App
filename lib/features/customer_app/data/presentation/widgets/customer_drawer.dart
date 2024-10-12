import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import 'drawer_items.dart';
import 'user_drawer_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero, // لضبط المسافات حول القائمة
        children: const [
          SizedBox(height: 40),
          UserDrawerListTile(),
          Divider(
            color: AppColors.unSelectedNavBarIconColor,
            indent: 30,
            endIndent: 30,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: DrawerItems(),
          ),
        ],
      ),
    );
  }
}
