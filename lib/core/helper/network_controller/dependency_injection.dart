import 'package:get/get.dart';
import 'package:sit_app/core/helper/network_controller/network_listener.dart';

class DependencyInjection {
  static void iniit() {
    Get.put<NetworkListener>(NetworkListener(), permanent: true);
  }
}
