import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_images.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class SplashPage extends GetView {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.pokemonLogo,
                height: 200,
                width: 200,
              ),
              const Text(
                "POKÉ LIST - FELIPE PRATES",
                style: AppTextStyles.textBoldWhite16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
