import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkListener extends GetxController {
  final Connectivity _connectivity = Connectivity();
  bool _isSnackbarVisible = false;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionState);
  }

  void _updateConnectionState(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      // عرض Snackbar فقط إذا لم يكن ظاهرًا
      if (!_isSnackbarVisible) {
        _isSnackbarVisible = true;
        Get.rawSnackbar(
          messageText: const Text(
            'No internet connection',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          icon: const Icon(Icons.wifi_off, color: Colors.white),
          isDismissible: false,
          duration: const Duration(days: 1),
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          borderRadius: 12,
          maxWidth: 300,
        );
      }
    } else {
      if (_isSnackbarVisible) {
        Get.closeCurrentSnackbar();
        _isSnackbarVisible = false;

        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          messageText: const Text(
            'Internet is back',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          icon: const Icon(Icons.wifi, color: Colors.white),
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          borderRadius: 12,
          maxWidth: 300,
        );
      }
    }
  }
}
