import 'package:intl/intl.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/customer_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/login_screen.dart';
import 'package:sit_app/main.dart';
import '../../../../../generated/l10n.dart';
import '../network/shared_preferenes.dart';

class LanguageIcon extends StatefulWidget {
  const LanguageIcon({super.key});

  @override
  _LanguageIconState createState() => _LanguageIconState();
}

class _LanguageIconState extends State<LanguageIcon> {
  String? _selectedLanguage;
  Timer? _languageChangeTimer;

  @override
  void initState() {
    super.initState();
    // updateLanguage(_selectedLanguage);
  }

  void updateLanguage(BuildContext context, String value) async {
    MyApp.setLocale(context, Locale(value));

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var user = await TokenStorage.getUser();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => user != null && user.token != null
              ? const CustomerScreen()
              : const LogInScreen(),
        ),
      );
    });

    _languageChangeTimer = Timer(const Duration(seconds: 1), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CustomerScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AppIcons.langugeIcon,
      onPressed: () {
        showMenu(
          color: AppColors.whaiteBackgroundColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          context: context,
          position: isArabic()
              ? const RelativeRect.fromLTRB(50, 80, 100, 0)
              : const RelativeRect.fromLTRB(100, 80, 50, 0),
          items: [
            PopupMenuItem<String>(
              value: 'ar',
              child: Row(
                children: [
                  Text(S.of(context).Arabic),
                  if (Intl.getCurrentLocale() == 'ar')
                    const Icon(Icons.check, color: Colors.green),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'en',
              child: Row(
                children: [
                  Text(S.of(context).English),
                  if (Intl.getCurrentLocale() == 'en')
                    const Icon(Icons.check, color: Colors.green),
                ],
              ),
            ),
            // PopupMenuItem<String>(
            //   value: 'ur',
            //   child: Row(
            //     children: [
            //       Text(S.of(context).Urdu),
            //       if (_selectedLanguage == 'ur')
            //         const Icon(Icons.check, color: Colors.green),
            //     ],
            //   ),
            // ),
          ],
        ).then((value) {
          if (value != null && value != _selectedLanguage) {
            setState(() {
              _selectedLanguage = value;

              // _languageChangeTimer = Timer(const Duration(seconds: 1), () {});
            });
            updateLanguage(context, value);
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _languageChangeTimer?.cancel();
    super.dispose();
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
