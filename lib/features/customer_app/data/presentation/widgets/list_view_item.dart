import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/utils/app_styles.dart';

class ListViewGuideItem extends StatelessWidget {
  const ListViewGuideItem({
    required this.item,
    super.key,
  });
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    // تغيير الطول بناءً على عرض الشاشة
    return Stack(
      children: [
        Container(
          // width: constraints.maxWidth,
          // height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(item['image']!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          // width: constraints.maxWidth,
          // height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.0),
              ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 30,
          child: Row(
            children: [
              Text(
                item['label']!,
                style: AppStyles.styleSemiBold20W500,
              ),
              const SizedBox(width: 8),
              AppIcons.guideListIcon,
            ],
          ),
        ),
      ],
    );
  }
}
