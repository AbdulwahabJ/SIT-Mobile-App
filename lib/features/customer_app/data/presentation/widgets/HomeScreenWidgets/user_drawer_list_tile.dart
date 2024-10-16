import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import '../../../../../auth/logic/auth_cubit.dart';
import '../../../../logic/staff_cubit.dart';

class UserDrawerListTile extends StatefulWidget {
  const UserDrawerListTile({
    super.key,
  });

  @override
  State<UserDrawerListTile> createState() => _UserDrawerListTileState();
}

class _UserDrawerListTileState extends State<UserDrawerListTile> {
  // UserModel? _user;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadUser();
  // }

  // Future<void> _loadUser() async {
  //   _user = await TokenStorage.getUser();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
          backgroundImage: AssetImage(AppImages.umrahProgramImage)),
      title: Text(
        // user!.name, // استخدام العنوان من الـ Map
        ',',
        style: AppStyles.styleReguler16W600,
      ),
      subtitle: Text(
        // user.email'',
        '',
        style: AppStyles.styleReguler11,
      ),
    );
  }
}
