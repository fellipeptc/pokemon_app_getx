import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';

class ValidateFieldWidget extends GetView {
  final String textValidate;
  final RxBool validate;

  const ValidateFieldWidget({
    Key? key,
    required this.textValidate,
    required this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () {
              if (validate.value) {
                return const Icon(
                  Icons.done,
                  color: AppColors.primary,
                  size: 18,
                );
              }
              return const Icon(
                Icons.circle_outlined,
                color: AppColors.border,
                size: 18,
              );
            },
          ),
          const SizedBox(width: 10),
          Text(
            textValidate.capitalizeFirst!,
            style: AppTextStyles.textNormalBlack14.fs(12),
          ),
        ],
      ),
    );
  }
}
