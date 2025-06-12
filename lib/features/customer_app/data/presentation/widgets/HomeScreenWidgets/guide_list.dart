import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/guide_list_view_indecetor.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/HomeScreenWidgets/list_view_guide_item.dart';

import '../../../../../../core/helper/app_cache.dart';

class GuideListView extends StatefulWidget {
  const GuideListView({super.key});

  @override
  State<GuideListView> createState() => _GuideListViewState();
}

class _GuideListViewState extends State<GuideListView> with RouteAware {
  List<Map<String, String>> items = [];
  @override
  void initState() {
    super.initState();

    setState(() {
      items = AppCache.guiedItems;
    });

    // AppCache().preloadFiles().then((_) {
    //   setState(() {}); // نحدث الشاشة عند اكتمال الكاش
    // });
  }

  //
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ScreenUtil.getHeight(context, 0.28),
          child: CarouselSlider(
            items: items.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    if (item['link'] == null || item['link']!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'الرجاء الانتظار حتى يتم تحميل الملف بالكامل'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      // ListViewGuideItem(item: item);
                      // print("فتح الملف: ${item['link']}");
                    }
                  },
                  child: ListViewGuideItem(item: item),
                ),
              );
            }).toList(),
            carouselController: _carouselController,
            options: CarouselOptions(
              height: ScreenUtil.getHeight(context, 0.6),
              aspectRatio: 16 / 9,
              // viewportFraction: 0.88,
              // initialPage: initialPage,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: false,
              padEnds: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                  // padEnds = (currentPage == 0) ? false : true;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        GuideListViewIndecetor(
            items: items,
            carouselController: _carouselController,
            currentPage: currentPage),
      ],
    );
  }
}
