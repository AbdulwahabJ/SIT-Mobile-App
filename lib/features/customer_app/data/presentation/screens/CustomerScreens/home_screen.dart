import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import '../../widgets/HomeScreenWidgets/customer_drawer.dart';
import '../../widgets/HomeScreenWidgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          return Padding(
            padding: isArabic()
                ? const EdgeInsets.only(right: 16.0)
                : const EdgeInsets.only(left: 16.0),
            child: IconButton(
              icon: AppIcons.drawerIcon,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppImages.companyLogo,
                width: ScreenUtil.getWidth(context, 0.3),
                height: ScreenUtil.getHeight(context, 0.09),
              ),
            ),
            const LanguageIcon()
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: const HomeScreenBody(),
    );
  }
}
