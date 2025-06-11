import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/helper/user_info.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/drawer_item.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../auth/logic/auth_cubit.dart';
import '../../../../../auth/logic/auth_state.dart';

class DrawerItems extends StatefulWidget {
  const DrawerItems({
    super.key,
  });

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  bool isStaff = false;
  _ifUserAdmin() async {
    isStaff = await isUserStaff();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.getHeight(context, 0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min, // تجعل حجم العمود يتبع حجم المحتوى

        children: [
          isStaff
              ? DrawerItem(
                  icon: AppIcons.settingsIcon, text: S.of(context).settings)
              : Container(),
          //const SizedBox(height: 28),
          DrawerItem(icon: AppIcons.settingsIcon, text: S.of(context).settings),
          const SizedBox(height: 28),

          DrawerItem(icon: AppIcons.supportIcon, text: S.of(context).support),
          const Spacer(flex: 7),

          // BlocConsumer للتحكم في حالة تسجيل الخروج
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginScreen,
                  (route) => false,
                );
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                });
              } else if (state is AuthFailure) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                });
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return DrawerItem(
                  icon: AppIcons.signOutIcon, text: S.of(context).signOut);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
