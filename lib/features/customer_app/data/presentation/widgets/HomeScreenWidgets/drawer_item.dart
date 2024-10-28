import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/CustomerScreens/settings_screen.dart';

import '../../../../../auth/logic/auth_cubit.dart';
import '../../../services/whats_app_service.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.text,
  });

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case 'Settings' || 'الاعدادات':
            Navigator.push(
              context,
              _createRoute(), // استخدام الدالة المخصصة للانتقال
            );
            break;
          case 'Support' || 'الدعم':
            openWhatsApp(
                phoneNumber: AppTexts.supportNumber,
                text: AppTexts.supoortText);
            break;
          case 'Sign Out' || 'تسجيل الخروج':
            context.read<AuthCubit>().logOut();
            break;
        }
      },
      child: Row(
        children: [
          icon,
          const SizedBox(width: 12),
          Text(
            text,
            style: AppStyles.styleReguler16W600,
          ),
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SettingsScreen(), // هنا ضع شاشة الإعدادات
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = isArabic()
            ? const Offset(1.0, 0.0)
            : const Offset(-1.0, 0.0); // البداية من اليمين
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
