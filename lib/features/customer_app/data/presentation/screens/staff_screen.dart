import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_styles.dart';

import '../../../../../core/constants/app_icons.dart';

class SttafScreen extends StatelessWidget {
  const SttafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Ahmed Mohammed',
        'date': 'arabic'
      },
      {
        'image': 'assets/images/dars_program.png',
        'title': 'Khalid Ali',
        'date': 'arabic&english'
      },
      {
        'image': 'assets/images/dars_program.png',
        'title': 'Malik Ahmed',
        'date': 'urdu'
      },
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.authScreensPadding,
          right: AppPadding.authScreensPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
              AppTexts.staffHeader,
              style: AppStyles.styleSemiBold22
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ListTile(
                    tileColor: AppColors.whaiteBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage(AppImages.umrahProgramImage)),
                    title: Text(
                      item['title']!, // استخدام العنوان من الـ Map
                      style: AppStyles.styleSemiBold16,
                    ),
                    subtitle: Text(
                      item['date']!, // استخدام التاريخ من الـ Map
                      style: AppStyles.styleReguler13,
                    ),
                    trailing: Transform.rotate(
                        angle: 5.5,
                        child: IconButton(
                          onPressed: () {},
                          icon: AppIcons.staffSendIconIcon,
                        )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
