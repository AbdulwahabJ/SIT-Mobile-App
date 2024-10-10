import 'package:flutter/material.dart';
import 'package:sit_app/core/utils/app_images.dart';
import 'package:sit_app/core/utils/app_styles.dart';

class UserDrawerListTile extends StatelessWidget {
  const UserDrawerListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading:
          CircleAvatar(backgroundImage: AssetImage(Assets.umrahProgramImage)),
      title: Text(
        'Ahmed malik', // استخدام العنوان من الـ Map
        style: AppStyles.styleReguler16W600,
      ),
      subtitle: Text(
        'ahmed@gmail.com ',
        style: AppStyles.styleReguler11,
      ),
    );
  }
}
