import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_app/core/helper/custom_snackbar.dart';

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
      if (!_isSnackbarVisible) {
        CustomSnackbar.noInternet();
        _isSnackbarVisible = true;
      }
    } else {
      if (_isSnackbarVisible) {
        CustomSnackbar.internetIsBack();
        Get.closeCurrentSnackbar();
        _isSnackbarVisible = false;
      }
    }
  }
}
