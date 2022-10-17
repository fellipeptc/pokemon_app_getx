import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../themes/app_colors.dart';

class CustomTextField extends GetView {
  final String label;
  final Color? fillColor;
  final IconData? iconData;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? password;
  final Function()? onTapPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? labelCenter;
  final TextCapitalization? textCapitalization;

  const CustomTextField({
    Key? key,
    required this.label,
    this.fillColor,
    this.iconData,
    required this.textEditingController,
    this.textInputType,
    this.inputFormatters,
    this.password,
    this.onTapPassword,
    this.validator,
    this.onChanged,
    this.labelCenter,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType ?? TextInputType.name,
      inputFormatters: inputFormatters,
      obscureText: password ?? false,
      textAlign: labelCenter == true ? TextAlign.center : TextAlign.start,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.black,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        fillColor: fillColor ?? Colors.transparent,
        filled: true,
        floatingLabelBehavior: labelCenter == true
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.auto,
        label: labelCenter == true
            ? Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.label,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            : Text(
                label,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.label,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
        suffixIcon: password != null
            ? GestureDetector(
                onTap: onTapPassword,
                child: Icon(
                  password == false
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 18,
                  color: AppColors.label,
                ),
              )
            : (iconData != null
                ? Icon(
                    iconData,
                    size: 18,
                    color: AppColors.label,
                  )
                : null),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.erro,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
