import 'package:flutter/material.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';

class ListViewMomentImagesItem extends StatelessWidget {
  const ListViewMomentImagesItem({
    required this.item,
    super.key,
  });
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getWidth(context, 0.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(item['image']!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
