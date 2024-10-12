import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/utils/app_styles.dart';

import '../../../../../core/utils/app_images.dart';
import '../widgets/moment_images_list_view.dart';

class MomentsScreen extends StatefulWidget {
  const MomentsScreen({super.key});

  @override
  State<MomentsScreen> createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.homeScreensPadding,
          // right: AppPadding.homeScreensPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Center(
                child: Image(
              image: AssetImage(AppImages.momentsImage),
              // height: 60,
              width: 50,
            )),
            const SizedBox(height: 10),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                AppTexts.momentsHeader,
                style: AppStyles.styleSemiBold18
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(height: 20),
            MomentsItem(),
            MomentsItem(),
            MomentsItem(),
          ],
        ),
      ),
    );
  }
}

class MomentsItem extends StatelessWidget {
  const MomentsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Image(image: AssetImage(AppImages.stteperImage)),
            SizedBox(width: 8),
            Text(
              'Holy Mosques',
              style: AppStyles.styleSemiBold16,
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 120,
                child: VerticalDivider(
                  color: AppColors.primaryColor,
                  thickness: 2,
                  // endIndent: 1,
                  // indent: 0,
                ),
              ),
            ),
            Expanded(child: MomentImagesListView())
          ],
        )
      ],
    );
  }
}
