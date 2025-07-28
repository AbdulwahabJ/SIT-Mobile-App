import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void success(String message) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      borderRadius: 12,
      maxWidth: 300,
    );
  }

  static void error(String message) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      icon: const Icon(Icons.error, color: Colors.white),
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      borderRadius: 12,
      maxWidth: 300,
    );
  }

  static void noInternet() {
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

  static void internetIsBack() {
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
