import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_cubit.dart';
import '../../../../../../core/helper/language.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../logic/AdminSettingsCubit/admin_settings_state.dart';
import '../../widgets/MomentsScreenWidgets/moments_item.dart';

class MomentsScreen extends StatefulWidget {
  const MomentsScreen({super.key});

  @override
  State<MomentsScreen> createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  List<dynamic> holyMosquesList = [];
  List<dynamic> mazaratList = [];
  List<dynamic> religiousLecturesList = [];

  @override
  void initState() {
    super.initState();
    context.read<AdminSettingsCubit>().getMoments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AdminSettingsCubit, AdminSettingsState>(
        listener: (context, state) {
          if (state is GetMomentsSuccesse) {
            setState(() {
              holyMosquesList = state.holyMosquesList;
              mazaratList = state.mazaratList;
              religiousLecturesList = state.religiousLecturesList;
            });

            // print('list hh ${holyMosquesList}');
          } else if (state is DeleteMomentImageSuccesse) {
            context.read<AdminSettingsCubit>().getMoments();

            _showSnackBar(state.message);
          }
        },
        child: Padding(
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
              MomentsItem(
                sectionText: S.of(context).holyMosques,
                imagesList: holyMosquesList,
              ),
              MomentsItem(
                sectionText: S.of(context).mazarat,
                imagesList: mazaratList,
              ),
              MomentsItem(
                sectionText: S.of(context).religiousLectures,
                imagesList: religiousLecturesList,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
