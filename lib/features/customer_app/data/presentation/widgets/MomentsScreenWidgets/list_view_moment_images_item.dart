import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';

class ListViewMomentImagesItem extends StatefulWidget {
  const ListViewMomentImagesItem({
    required this.item,
    super.key,
  });
  final String item;

  @override
  State<ListViewMomentImagesItem> createState() =>
      _ListViewMomentImagesItemState();
}

class _ListViewMomentImagesItemState extends State<ListViewMomentImagesItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl: widget.item,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Text('Can\'t display the image'),
                ),
              ),
            ),
          ),
        );
      },
      child: SizedBox(
        width: ScreenUtil.getWidth(context, 0.6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: widget.item,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
