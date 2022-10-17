import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_colors.dart';

mixin SnackbarMixin on GetxController {
  void showSnackBar(
    String title,
    String message,
    Color backColor,
  ) {
    Get.snackbar(
      title,
      message,
      instantInit: true,
      borderRadius: 0,
      margin: EdgeInsets.zero,
      colorText: AppColors.white,
      backgroundColor: backColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
    );
  }
}
