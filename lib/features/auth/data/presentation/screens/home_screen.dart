import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/guide_list.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/today_program_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const Drawer(),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                icon: AppIcons.drawerIcon,
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // فتح الـ Drawer عند الضغط
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
                child: IconButton(
                  icon: Image.asset(
                    Assets.companyLogo,
                    width: ScreenUtil.getWidth(context, 0.3),
                    height: ScreenUtil.getHeight(context, 0.09),
                  ),
                  onPressed: () {
                    // أضف هنا وظيفة تغيير اللغة
                  },
                ),
              ),
              IconButton(
                icon: AppIcons.langugeIcon,
                onPressed: () {
                  // أضف هنا وظيفة تغيير اللغة
                },
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: AppPadding.homeScreensPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.homeScreensTextPadding),
                  child: Text(
                    'Hello Ahmed',
                    style: AppStyles.styleSemiBold26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.homeScreensTextPadding),
                  child: Text(
                    'have a nice day',
                    style: AppStyles.styleLight12
                        .copyWith(color: AppColors.unSelectedNavBarIconColor),
                  ),
                ),
                const SizedBox(height: 20),
                const GuideListView(),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.homeScreensTextPadding),
                  child:
                      Text('Today Program', style: AppStyles.styleSemiBold18),
                ),
                const SizedBox(height: 20),
                const TodayProgramListView(),
              ],
            ),
          ),
        ));
  }
}
