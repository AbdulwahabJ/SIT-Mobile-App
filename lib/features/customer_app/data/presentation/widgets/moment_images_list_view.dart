import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/list_view_moment_images_item.dart';

import '../../../../../core/utils/app_screen_utils.dart';

class MomentImagesListView extends StatefulWidget {
  const MomentImagesListView({super.key});

  @override
  State<MomentImagesListView> createState() => _MomentImagesListViewState();
}

class _MomentImagesListViewState extends State<MomentImagesListView> {
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
    return SizedBox(
      height: ScreenUtil.getHeight(context, 0.17),
      child: CarouselSlider(
        items: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8.0),
            child: ListViewMomentImagesItem(item: item),
          );
        }).toList(),
        carouselController: _carouselController,
        options: CarouselOptions(
          // height: ScreenUtil.getHeight(context, 0.6),
          // aspectRatio: 16 / 9,
          viewportFraction: 0.7,
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
    );
  }
}
