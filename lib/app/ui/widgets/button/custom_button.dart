import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class CustomButtonStyle {
  static final primary = CustomButtonStyle(
    backgroundColor: AppColors.primary,
    titleColor: AppColors.white,
    fontSize: 15,
    rippleColor: AppColors.white,
  );

  static final primaryOutline = CustomButtonStyle(
    backgroundColor: AppColors.white,
    titleColor: AppColors.primary,
    fontSize: 15,
    borderColor: AppColors.primary,
    rippleColor: AppColors.primary,
  );

  final Color backgroundColor;
  final Color titleColor;
  final double fontSize;
  final Color borderColor;
  final Color rippleColor;

  CustomButtonStyle({
    required this.backgroundColor,
    required this.titleColor,
    required this.fontSize,
    required this.rippleColor,
    this.borderColor = Colors.white,
  });
}

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final CustomButtonStyle style;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final bool border;
  final double? borderRadius;
  final bool disabled;
  final FocusNode? focusNode;
  final bool? hasIcon;

  const CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    required this.style,
    required this.onPressed,
    this.padding,
    this.border = false,
    this.borderRadius,
    this.disabled = false,
    this.focusNode,
    this.hasIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        focusNode: focusNode,
        onPressed: disabled ? null : onPressed,
        style: TextButton.styleFrom(
          primary: style.rippleColor,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: disabled
              ? style.backgroundColor.withOpacity(0.5)
              : style.backgroundColor,
          shape: border
              ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            side: BorderSide(
              color: style.borderColor,
              width: 1,
            ),
          )
              : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
          ),
        ),
        child: hasIcon == true ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: style.fontSize,
                fontWeight: FontWeight.w400,
                color: style.titleColor,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward, color: style.titleColor,),
          ],
        ) : Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: style.fontSize,
            fontWeight: FontWeight.w400,
            color: style.titleColor,
          ),
        ),
      ),
    );
  }
}
