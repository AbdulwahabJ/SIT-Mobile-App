import 'package:flutter/material.dart';
import 'package:sit_app/core/utils/app_styles.dart';

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
    return Row(
      children: [
        icon,
        const SizedBox(width: 12),
        Text(
          text,
          style: AppStyles.styleReguler16W600,
        ),
      ],
    );
  }
}
