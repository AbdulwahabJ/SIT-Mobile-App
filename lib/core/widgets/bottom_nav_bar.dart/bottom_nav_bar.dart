import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/home_screen.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/staff_screen.dart';
import '../../../features/customer_app/data/presentation/screens/moments_screen.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int currentIndex = 1; // لتعقب الشاشة الحالية

  // قائمة بالشاشات
  final List<Widget> screens = const [
    SttafScreen(),
    HomeScreen(),
    MomentsScreen(),
  ];

  // تغيير التبويب عند الضغط
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: _onItemTapped, // استدعاء دالة تغيير التبويب
      ),
    );
  }
}
