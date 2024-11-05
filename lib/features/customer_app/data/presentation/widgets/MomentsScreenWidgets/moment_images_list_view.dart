import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sit_app/features/customer_app/data/presentation/widgets/MomentsScreenWidgets/list_view_moment_images_item.dart';
import '../../../../../../core/utils/app_screen_utils.dart';

class MomentImagesListView extends StatefulWidget {
  const MomentImagesListView({super.key, required this.imagesList});
  final List<dynamic>? imagesList;

  @override
  State<MomentImagesListView> createState() => _MomentImagesListViewState();
}

class _MomentImagesListViewState extends State<MomentImagesListView> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.getHeight(context, 0.17),
      child: CarouselSlider(
        items: widget.imagesList!.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8.0),
            child: GestureDetector(
              onLongPress: () {
                _showDeleteConfirmationDialog(item);
              },
              child: ListViewMomentImagesItem(item: item),
            ),
          );
        }).toList(),
        carouselController: _carouselController,
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 0.7,
          scrollDirection: Axis.horizontal,
          enableInfiniteScroll: false,
          padEnds: false,
          onPageChanged: (index, reason) {
            setState(() {
              currentPage = index;
            });
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(dynamic item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("تأكيد الحذف"),
          content: const Text("هل تريد حذف هذه الصورة؟"),
          actions: <Widget>[
            TextButton(
              child: const Text("لا"),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
            TextButton(
              child: const Text("نعم"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
