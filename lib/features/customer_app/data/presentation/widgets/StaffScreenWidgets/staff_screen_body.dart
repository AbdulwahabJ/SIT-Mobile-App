import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/today_program_list_view.dart';
import 'package:sit_app/generated/l10n.dart';

class StaffScreenBody extends StatefulWidget {
  const StaffScreenBody({
    super.key,
  });

  @override
  State<StaffScreenBody> createState() => _StaffScreenBodyState();
}

class _StaffScreenBodyState extends State<StaffScreenBody> {
  dynamic user;
  @override
  void initState() {
    super.initState();
    getUsertypeInfo();
  }

  Future<dynamic> getUsertypeInfo() async {
    dynamic usertype = await getUserInfo(context);
    setState(() {
      user = usertype;
    });
  }

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
            Center(
              child: Text(
                textAlign: TextAlign.center,
                S.of(context).staffMessage,
                style: AppStyles.styleLight14
                    .copyWith(color: AppColors.unSelectedNavBarIconColor),
              ),
            ),
            const SizedBox(height: 20),
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
