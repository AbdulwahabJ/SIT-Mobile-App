import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';

import '../../../../auth/logic/auth_cubit.dart';
import '../../services/whats_app_service.dart';

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
          case 'Settings':
            Navigator.pushNamed(context, AppRoutes.settingsScreen);
            break;
          case 'Support':
            openWhatsApp(phoneNumber: AppTexts.supportNumber, text: 'dsdsds');
            break;
          case 'SignOut':
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
}
