import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/guide_list_view_indecetor.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/list_view_guide_item.dart';

class GuideListView extends StatefulWidget {
  const GuideListView({super.key});

  @override
  State<GuideListView> createState() => _GuideListViewState();
}

class _GuideListViewState extends State<GuideListView> with RouteAware {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int currentPage = 0;
  // bool padEnds = false;

  final List<Map<String, String>> items = [
    {'image': 'assets/images/umrah_guide.jpg', 'label': 'Umrah Guide'},
    {'image': 'assets/images/madina_guide.jpg', 'label': 'Madina Guide'},
    {'image': 'assets/images/mazarat_guide.jpg', 'label': 'Madina Guide'},
  ];

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
                child: ListViewGuideItem(item: item),
              );
            }).toList(),
            carouselController: _carouselController,
            options: CarouselOptions(
              height: ScreenUtil.getHeight(context, 0.6),
              // aspectRatio: 16 / 9,
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
