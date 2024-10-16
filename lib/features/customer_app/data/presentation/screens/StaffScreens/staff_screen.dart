import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/StaffScreenWidgets/staff_screen_body.dart';
import '../../widgets/HomeScreenWidgets/customer_drawer.dart';
import '../../widgets/HomeScreenWidgets/home_screen_body.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({
    super.key,
  });

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: ScreenUtil.getWidth(context, 0.7),
        child: const AppDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: AppIcons.drawerIcon,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset(
              AppImages.companyLogo,
              width: ScreenUtil.getWidth(context, 0.3),
              height: ScreenUtil.getHeight(context, 0.09),
            ),
            const LanguageIcon()
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: const StaffScreenBody(),
    );
  }
}
