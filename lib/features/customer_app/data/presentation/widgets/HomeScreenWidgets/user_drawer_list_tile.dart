import 'package:flutter/material.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/models/user_model.dart';

class UserDrawerListTile extends StatefulWidget {
  const UserDrawerListTile({
    super.key,
  });

  @override
  State<UserDrawerListTile> createState() => _UserDrawerListTileState();
}

class _UserDrawerListTileState extends State<UserDrawerListTile> {
  UserModel? _user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    _user = await TokenStorage.getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: _user!.image != null
              ? NetworkImage(
                  _user!.image,
                )
              : const AssetImage(AppImages.umrahProgramImage)),
      title: Text(
        _user != null ? _user!.name : ',',
        style: AppStyles.styleReguler16W600,
      ),
      subtitle: Text(
        _user != null ? _user!.email : ',',
        style: AppStyles.styleReguler11,
      ),
    );
  }
}
