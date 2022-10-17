import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../themes/app_images.dart';
import '../../themes/app_text_styles.dart';
import '../button/custom_button.dart';

class AlertDialogLogout extends StatelessWidget {
  const AlertDialogLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        "DIALOG_LOGOUT".tr,
        style: AppTextStyles.textNormalBlack14.fs(16),
        textAlign: TextAlign.center,
      ),
      icon: Image.asset(
        AppImages.pokemonLogo,
        height: Get.size.height * 0.1,
        width: Get.size.width * 0.05,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                height: 35,
                width: Get.size.width * 0.22,
                borderRadius: 40,
                title: "DIALOG_YES".tr,
                style: CustomButtonStyle.primary,
                onPressed: () =>
                    Get.until((route) => Get.currentRoute == AppRoutes.login),
              ),
              CustomButton(
                height: 35,
                width: Get.size.width * 0.22,
                borderRadius: 40,
                title: "DIALOG_NO".tr,
                style: CustomButtonStyle.primaryOutline,
                border: true,
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
