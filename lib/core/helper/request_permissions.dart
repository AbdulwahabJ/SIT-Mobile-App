import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    // Permission.storage,
    Permission.mediaLibrary,
  ].request();

  return statuses.values.every((status) => status.isGranted);
}







// Future<bool> requestPermissions() async {
//   PermissionStatus cameraStatus = await Permission.camera.request();
//   PermissionStatus storageStatus = await Permission.storage.request();

//   if (cameraStatus.isGranted && storageStatus.isGranted) {
//     return true;
//   }
//   return false;
// }
