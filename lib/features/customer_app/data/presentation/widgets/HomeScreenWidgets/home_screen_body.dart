import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/guide_list.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/today_program_list_view.dart';
import 'package:sit_app/generated/l10n.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isArabic()
          ? const EdgeInsets.only(right: AppPadding.homeScreensPadding)
          : const EdgeInsets.only(left: AppPadding.homeScreensPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.homeScreensTextPadding),
              child: Text(
                S.of(context).hello,
                style: AppStyles.styleSemiBold26,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.homeScreensTextPadding),
              child: Text(
                S.of(context).have_a_nice_day,
                style: AppStyles.styleLight14
                    .copyWith(color: AppColors.unSelectedNavBarIconColor),
              ),
            ),
            const SizedBox(height: 20),
            const GuideListView(),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.homeScreensTextPadding),
              child: Text(S.of(context).todayProgram,
                  style: AppStyles.styleSemiBold18),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(
                  right: isArabic() ? 0 : 19.0, left: isArabic() ? 19 : 0),
              child: const TodayProgramListView(),
            ),
          ],
        ),
      ),
    );
  }
}
