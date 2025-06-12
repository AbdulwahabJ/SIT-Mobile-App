import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    // Permission.storage,
    Permission.mediaLibrary,
  ].request();

  return statuses.values.every((status) => status.isGranted);
}





