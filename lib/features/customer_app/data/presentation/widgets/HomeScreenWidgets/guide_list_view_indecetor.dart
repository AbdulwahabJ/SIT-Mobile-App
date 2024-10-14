import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';

class GuideListViewIndecetor extends StatelessWidget {
  const GuideListViewIndecetor({
    super.key,
    required this.items,
    required CarouselSliderController carouselController,
    required this.currentPage,
  }) : _carouselController = carouselController;

  final List<Map<String, String>> items;
  final CarouselSliderController _carouselController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _carouselController.animateToPage(entry.key),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: currentPage == entry.key ? 30.0 : 8,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: currentPage == entry.key
                    ? [
                        AppColors.whaiteBackgroundColor.withOpacity(0.7),
                        AppColors.accentColor.withOpacity(0.9),
                      ]
                    : [
                        AppColors.whaiteBackgroundColor,
                        AppColors.iconTextFieldColor.withOpacity(0.2),
                      ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
