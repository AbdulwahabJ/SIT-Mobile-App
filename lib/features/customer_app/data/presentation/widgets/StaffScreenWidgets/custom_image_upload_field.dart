import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // استيراد مكتبة image_picker
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/helper/request_permissions.dart';
import 'package:sit_app/generated/l10n.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class CustomImageUploadWidget extends StatefulWidget {
  final Icon icon;
  final Function(XFile?) onImageSelected;

  const CustomImageUploadWidget({
    super.key,
    required this.icon,
    required this.onImageSelected,
  });

  @override
  State<CustomImageUploadWidget> createState() =>
      _CustomImageUploadWidgetState();
}

class _CustomImageUploadWidgetState extends State<CustomImageUploadWidget> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage() async {
    if (await requestPermissions()) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
      if (_imageFile != null) {
        widget.onImageSelected(_imageFile); 
      }
    } else {
      _showPermissionDeniedMessage();
    }
  }

  // رسالة تنبيه إذا كانت الأذونات مرفوضة
  void _showPermissionDeniedMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Permissions required"),
          content:
              const Text("Please grant the necessary permissions to proceed."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImage,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            widget.icon,
            const SizedBox(width: 10),
            Text(
              _imageFile == null ? S.of(context).photo : _imageFile!.name,
              style: AppStyles.styleLight14,
            ),
            const Spacer(),
            AppIcons.uploadImage,
          ],
        ),
      ),
    );
  }
}
