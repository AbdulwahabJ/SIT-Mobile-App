import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/models/user_model.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/guide_list.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/today_program_list_view.dart';
import 'package:sit_app/generated/l10n.dart';

import '../../../../logic/AdminSettingsCubit/admin_settings_cubit.dart';
import '../../../../logic/AdminSettingsCubit/admin_settings_state.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  UserModel? _user;
  String? user_group;
  bool isAdmin = false;
  String? _selectedGroup;
  List<String>? dropdownItems = [''];
  String? ifUserHaveGroupName;

  @override
  void initState() {
    super.initState();
    _ifUserAdmin();
    _loadUser();
    _loadGroups();
    // _isUserhaveGroup();
  }

  Future<void> _loadUser() async {
    user_group = await isUserHaveGroup();

    _user = await TokenStorage.getUser();
    setState(() {});
  }

  // Future<void> _isUserhaveGroup() async {
  //   String? userGroupName = await isUserHaveGroup();
  //   setState(() {
  //     ifUserHaveGroupName = userGroupName;
  //   });
  //   print('User group: $ifUserHaveGroupName');
  // }

  Future<void> _loadGroups() async {
    await context.read<AdminSettingsCubit>().getGroup();
    await context
        .read<AdminSettingsCubit>()
        .getProgramsForToday(isAdmin ? "all groups" : user_group);
  }

  Future<void> _ifUserAdmin() async {
    bool respons = await isUserAdmin();
    setState(() {
      isAdmin = respons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminSettingsCubit, AdminSettingsState>(
      listener: (context, state) {
        if (state is GroupsUploadedSuccess) {
          setState(() {
            dropdownItems =
                context.read<AdminSettingsCubit>().allGroups?.cast<String>() ??
                    [];
          });
        }
      },
      child: Padding(
        padding: isArabic()
            ? const EdgeInsets.only(right: AppPadding.homeScreensPadding)
            : const EdgeInsets.only(left: AppPadding.homeScreensPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.homeScreensTextPadding),
              child: _user != null
                  ? Text(
                      '${S.of(context).hello} ${_user!.name}',
                      style: AppStyles.styleSemiBold26,
                    )
                  : Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.homeScreensTextPadding),
                  child: Text(S.of(context).todayProgram,
                      style: AppStyles.styleSemiBold18),
                ),
                isAdmin
                    ? Padding(
                        padding: EdgeInsets.only(
                            right: isArabic() ? 0 : 19.0,
                            left: isArabic() ? 19 : 0),
                        child: dropDownList(context),
                      )
                    : Container()
              ],
            ),
            const SizedBox(height: 10),
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

  Container dropDownList(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.whaiteBackgroundColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        hint: Text('select'),
        value: dropdownItems != null ? dropdownItems![0] : _selectedGroup,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: AppColors.accentColor,
        ),
        style: AppStyles.styleSemiBold18
            .copyWith(color: AppColors.unSelectedNavBarIconColor),
        underline: const SizedBox(), // إخفاء الخط السفلي الافتراضي
        onChanged: (String? newValue) {
          setState(() {
            _selectedGroup = newValue;
          });
          context.read<AdminSettingsCubit>().getProgramsForToday(
              _selectedGroup!.isNotEmpty ? _selectedGroup : "");
        },
        items: dropdownItems!.map(_buildDropdownItem).toList(),
      ),
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String code) {
    return DropdownMenuItem<String>(
      value: code,
      child: Text(
        code,
        style: AppStyles.styleLight14,
      ),
    );
  }
}
