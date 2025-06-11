import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import '../../../../../../core/helper/language.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../generated/l10n.dart';
import '../../widgets/MomentsScreenWidgets/moment_images_list_view.dart';

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
        padding: isArabic()
            ? const EdgeInsets.only(right: AppPadding.homeScreensPadding)
            : const EdgeInsets.only(left: AppPadding.homeScreensPadding),
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
                S.of(context).momentsScreenHeader,
                style: AppStyles.styleSemiBold18
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(height: 20),
            const MomentsItem(
              sectionText: 'Holy',
            ),
          ],
        ),
      ),
    );
  }
}

class MomentsItem extends StatelessWidget {
  const MomentsItem({
    super.key,
    required this.sectionText,
  });
  final String sectionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Image(image: AssetImage(AppImages.stteperImage)),
            const SizedBox(width: 8),
            Text(
              sectionText,
              style: AppStyles.styleSemiBold16,
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: isArabic()
                  ? const EdgeInsets.only(right: 8.0)
                  : const EdgeInsets.only(left: 8.0),
              child: const SizedBox(
                height: 120,
                child: VerticalDivider(
                  color: AppColors.primaryColor,
                  thickness: 2,
                  // endIndent: 1,
                  // indent: 0,
                ),
              ),
            ),
            const Expanded(child: MomentImagesListView())
          ],
        )
      ],
    );
  }
}
