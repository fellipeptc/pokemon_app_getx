import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/app_colors.dart';


class TranslationButton extends GetView {
  final String title;
  final bool active;
  final void Function()? onTap;

  const TranslationButton({
    Key? key,
    required this.title,
    required this.active,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: active ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: active ? AppColors.white : AppColors.border,
            ),
          ),
        ),
      ),
    );
  }
}
