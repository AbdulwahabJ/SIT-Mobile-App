import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/today_program_list_view.dart';
import 'package:sit_app/generated/l10n.dart';

import '../../../../logic/AdminSettingsCubit/admin_settings_cubit.dart';
import '../../../../logic/AdminSettingsCubit/admin_settings_state.dart';

class StaffScreenBody extends StatefulWidget {
  const StaffScreenBody({
    super.key,
  });

  @override
  State<StaffScreenBody> createState() => _StaffScreenBodyState();
}

class _StaffScreenBodyState extends State<StaffScreenBody> {
  dynamic user;
  String? _selectedGroup; // القيمة الافتراضية
  List<String>? dropdownItems = [''];
  @override
  void initState() {
    super.initState();
    getUsertypeInfo();
    loadGroups();
  }

  loadGroups() async {
    await context.read<AdminSettingsCubit>().getGroup();
  }

  Future<dynamic> getUsertypeInfo() async {
    dynamic usertype = await getUserInfo(context);
    setState(() {
      user = usertype;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminSettingsCubit, AdminSettingsState>(
      listener: (context, state) {
        if (state is AdminSettingsSuccess) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.homeScreensTextPadding),
                    child: Text(S.of(context).todayProgram,
                        style: AppStyles.styleSemiBold18),
                  ),
                  // const SizedBox(width: double.infinity),
                  Padding(
                    padding: isArabic()
                        ? const EdgeInsets.only(left: 20.0)
                        : const EdgeInsets.only(right: 20.0),
                    child: dropDownList(context),
                  ),
                ],
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
        value: _selectedGroup,
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
