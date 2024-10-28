import 'package:permission_handler/permission_handler.dart';

// دالة طلب الأذونات
Future<bool> requestPermissions() async {
  PermissionStatus cameraStatus = await Permission.camera.request();
  PermissionStatus storageStatus = await Permission.storage.request();

  if (cameraStatus.isGranted && storageStatus.isGranted) {
    return true;
  }
  return false;
}
