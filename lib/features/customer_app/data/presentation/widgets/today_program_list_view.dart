import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/utils/app_styles.dart';

class TodayProgramListView extends StatelessWidget {
  const TodayProgramListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Coming Umrah',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/dars_program.png',
        'title': 'Coming Dars',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/dars_program.png',
        'title': 'Coming Dars',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Coming Umrah',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Coming Umrah',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/dars_program.png',
        'title': 'Coming Dars',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Coming Umrah',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Coming Umrah',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Coming Umrah',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Coming Umrah',
        'date': 'Monday 08Aug 3:45pm'
      },
      {
        'image': 'assets/images/umrah_program.png',
        'title': 'Coming Umrah',
        'date': 'Monday 08Aug 3:45pm'
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 19.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              tileColor: AppColors.whaiteBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  item['image']!, // استخدام الصورة من الـ Map
                ),
              ),
              title: Text(
                item['title']!, // استخدام العنوان من الـ Map
                style: AppStyles.styleSemiBold16,
              ),
              subtitle: Text(
                item['date']!, // استخدام التاريخ من الـ Map
                style: AppStyles.styleReguler13,
              ),
            ),
          );
        },
      ),
    );
  }
}
