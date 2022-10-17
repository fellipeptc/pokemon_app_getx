import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_colors.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRx) {
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
