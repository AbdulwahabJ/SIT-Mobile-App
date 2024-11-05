import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_cubit.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_state.dart';

import '../../../../../../core/helper/language.dart';

class TodayProgramListView extends StatefulWidget {
  const TodayProgramListView({super.key});

  @override
  State<TodayProgramListView> createState() => _TodayProgramListViewState();
}

class _TodayProgramListViewState extends State<TodayProgramListView> {
  List<dynamic> programsList = [];

  @override
  void initState() {
    super.initState();
    getProgramsForToday();
  }

  Future<void> getProgramsForToday() async {
    String? userGroupName = await isUserHaveGroup();
    await context.read<AdminSettingsCubit>().getProgramsForToday(userGroupName);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisSize: MainAxisSize.min, // لضبط العمود ليكون مرنًا

        children: [
          BlocListener<AdminSettingsCubit, AdminSettingsState>(
            listener: (context, state) {
              if (state is GetProgramsForTodaySuccesse) {
                setState(() {
                  programsList = state.programsList;
                });
              } else if (state is AdminSettingsFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Failed to load programs: ${state.message}')),
                );
              }
            },
            child: Container(),
          ),
          BlocBuilder<AdminSettingsCubit, AdminSettingsState>(
            builder: (context, state) {
              if (state is AdminSettingsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (programsList.isEmpty) {
                return const Center(child: Text('No programs assigned yet'));
              }
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(), // new
                scrollDirection: Axis.vertical,
                itemCount: programsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = programsList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: ListTile(
                      tileColor: AppColors.whaiteBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      leading: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20.0),
                        child: todayProgramLeadingImage(item['program_name']),
                      ),
                      title: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 12.0),
                        child: Text(
                          translateProgramName(item['program_name']),
                          style: AppStyles.styleSemiBold16,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 12.0),
                        child: Text(
                          item['program_dateTime'],
                          style: AppStyles.styleReguler13,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  String translateProgramName(String? name) {
    if (isArabic()) {
      switch (name) {
        case 'Umrah':
          return 'عمرة';
        case 'Dars':
          return ' درس ديني';
        case 'Mazarat':
          return 'مزارات';
        default:
          return name ?? '';
      }
    } else {
      return name ?? '';
    }
  }

  Widget todayProgramLeadingImage(String? name) {
    switch (name) {
      case 'Umrah':
        return SizedBox(
            width: 38, child: Image.asset(AppImages.umrahProgramImage));
      case 'Dars':
        return SizedBox(
            width: 38, child: Image.asset(AppImages.darsProgramImage));
      case 'Mazarat':
        return SizedBox(
            width: 38, child: Image.asset(AppImages.mazaratProgramImage));
    }
    return Image.asset(AppImages.umrahProgramImage);
  }
}
