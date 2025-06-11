import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';

import '../../../../../../generated/l10n.dart';

class ListViewGuideItem extends StatelessWidget {
  const ListViewGuideItem({
    required this.item,
    super.key,
  });
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String? pdfPath = item['link'];
        String? label = item['label'];

        Navigator.pushNamed(
          context,
          AppRoutes.pdfViewerScreen,
          arguments: [pdfPath, label],
        );
      },
      child: Stack(
        children: [
          Container(
            // width: constraints.maxWidth,
            // height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(item['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            // width: constraints.maxWidth,
            // height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.0),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: isArabic() ? 0 : 30,
            right: isArabic() ? 30 : 0,
            child: Row(
              children: [
                Text(
                  item['label'] == "Umrah Guide"
                      ? S.of(context).umrahGuiedLabel
                      : item['label'] == "Madina Guide"
                          ? S.of(context).madinaGuiedLabel
                          : S.of(context).mazaratGuiedLabel,
                  style: AppStyles.styleSemiBold20W500,
                ),
                const SizedBox(width: 8),
                AppIcons.guideListIcon,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
