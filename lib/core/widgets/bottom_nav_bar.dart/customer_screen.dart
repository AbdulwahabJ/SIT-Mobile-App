import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/CustomerScreens/home_screen.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/CustomerScreens/staff_customer_screen.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/StaffScreens/staff_screen.dart';
import '../../../features/auth/data/models/user_model.dart';
import '../../../features/customer_app/data/presentation/screens/CustomerScreens/moments_screen.dart';
import '../../helper/user_info.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int currentIndex = 1; // لتعقب الشاشة الحالية
  dynamic user;
  // قائمة بالشاشات
  final List<Widget> screens = const [
    StaffCustomerScreen(),
    HomeScreen(),
    MomentsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<dynamic> getUser() async {
    dynamic userType = await getLoggedInUser();
    setState(() {
      user = userType;
    });
  }

  // تغيير التبويب عند الضغط
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user is UserModel) {
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
    return const StaffScreen();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Navigator.pushReplacementNamed(
    //     context,
    //     AppRoutes.staffScreen,
    //   );
    // });
  }
}
