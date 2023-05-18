import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_intern/src/conifg/theme/colorManger.dart';

class AppStates {
  static ErrorState(String message) {
    return Get.snackbar('Error', message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
  }

  static SucessState(String message) {
    return Get.snackbar('Sucess', message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorManager.primaryColor);
  }

  static Widget loadingState() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
          child: CircularProgressIndicator(
        color: ColorManager.primaryColor,
      )),
    );
  }
}
