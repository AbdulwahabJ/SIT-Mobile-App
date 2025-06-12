import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/helper/request_permissions.dart';
import 'package:sit_app/generated/l10n.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

// ignore: must_be_immutable
class CustomImagesUploadWidget extends StatefulWidget {
  final Icon icon;
  Function(List<XFile>) onImageSelected;
  CustomImagesUploadWidget({
    super.key,
    required this.icon,
    required this.onImageSelected,
  });

  @override
  State<CustomImagesUploadWidget> createState() =>
      _CustomImageUploadWidgetState();
}

class _CustomImageUploadWidgetState extends State<CustomImagesUploadWidget> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageFiles = [];

  Future<void> _pickImages() async {
    if (await requestPermissions()) {
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        setState(() {
          _imageFiles.addAll(pickedFiles);
          widget.onImageSelected(_imageFiles);
        });
      }
    } else {
      print('no prem');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImages,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                widget.icon,
                const SizedBox(width: 10),
                Text(
                  overflow: TextOverflow.ellipsis,
                  _imageFiles.isEmpty
                      ? S.of(context).momentsPhoto
                      : '${_imageFiles.length} images selected successfully',
                  style: AppStyles.styleLight14,
                ),
                const Spacer(),
                _imageFiles.isEmpty
                    ? AppIcons.uploadImage
                    : AppIcons.successIcon,
              ],
            ),
            const SizedBox(height: 10),
            _imageFiles.isNotEmpty
                ? SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _imageFiles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.file(
                            File(_imageFiles[index].path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
