import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/logic/bottom_nav_bar_cubit.dart';
import 'package:sit_app/features/auth/data/presentation/screens/home_screen.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/staff_screen.dart';

import '../../../features/customer_app/data/presentation/screens/moments_screen.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentIndex) {
          return IndexedStack(
            index: currentIndex,
            children: const [SttafScreen(), HomeScreen(), MomentsScreen()],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentIndex) {
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.selectedNavBarIconColor,
            unselectedItemColor: AppColors.unSelectedNavBarIconColor,
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: AppIcons.staffIcon,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: AppIcons.homeIcon,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: AppIcons.momenstIcon,
                label: '',
              ),
            ],
            onTap: (index) {
              // تغيير التبويب عند الضغط على أي عنصر
              context.read<BottomNavBarCubit>().changeTab(index);
            },
          );
        },
      ),
    );
  }
}
