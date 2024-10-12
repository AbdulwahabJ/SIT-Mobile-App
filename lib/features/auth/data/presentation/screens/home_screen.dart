import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/guide_list.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/today_program_list_view.dart';
import '../../../../customer_app/data/presentation/widgets/customer_drawer.dart';
import '../../../logic/auth_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String _selectedLanguage = 'en';

class _HomeScreenState extends State<HomeScreen> {
  // UserModel? _user; // لا حاجة إلى late هنا

  // @override
  // void initState() {
  //   super.initState();
  //   _loadUser();
  // }

  // Future<void> _loadUser() async {
  //   _user = await TokenStorage.getUser();
  //   print('sasaa111::${_user!.email}');

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().userInfo;
    return Scaffold(
      drawer: SizedBox(
        width: ScreenUtil.getWidth(context, 0.7),
        child: const AppDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
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
            IconButton(
              icon: AppIcons.langugeIcon,
              onPressed: () {
                // عرض قائمة اللغات عند الضغط
                showMenu(
                  color: AppColors.whaiteBackgroundColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  context: context,
                  position: const RelativeRect.fromLTRB(100, 90, 50, 0),
                  items: [
                    PopupMenuItem<String>(
                      value: 'ar',
                      child: Row(
                        children: [
                          const Text('Arabic'),
                          if (_selectedLanguage == 'ar')
                            const Icon(Icons.check, color: Colors.green),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'en',
                      child: Row(
                        children: [
                          const Text('English'),
                          if (_selectedLanguage == 'en')
                            const Icon(Icons.check, color: Colors.green),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'ur',
                      child: Row(
                        children: [
                          const Text('Urdu'),
                          if (_selectedLanguage == 'ur')
                            const Icon(Icons.check, color: Colors.green),
                        ],
                      ),
                    ),
                  ],
                ).then((value) {
                  if (value != null && value != _selectedLanguage) {
                    setState(() {
                      _selectedLanguage = value;
                    });
                  }
                });
              },
            )
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.homeScreensTextPadding),
                child: Text(
                  // 'Hello ${user!.name}'??'g',
                  'dd',
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
                child: Text('Today Program', style: AppStyles.styleSemiBold18),
              ),
              const SizedBox(height: 20),
              const TodayProgramListView(),
            ],
          ),
        ),
      ),
    );
  }
}
