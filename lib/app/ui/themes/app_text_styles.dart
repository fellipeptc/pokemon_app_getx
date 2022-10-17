import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles{

  //BOLD WHITE
  static const TextStyle textBoldWhite14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    //fontFamily: 'OpenSans',
  );
  static const TextStyle textBoldWhite16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    //fontFamily: 'OpenSans',
  );
  static const TextStyle textBoldWhite22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: 'OpenSans',
  );

  //BOLD BLACK
  static const TextStyle textBoldBlack16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontFamily: 'OpenSans',
  );
  static const TextStyle textBoldBlack22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontFamily: 'OpenSans',
  );

  //NORMAL WHITE
  static const TextStyle textNormalWhite14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontFamily: 'OpenSans',
  );

  //NORMAL BLACK
  static const TextStyle textNormalBlack14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: 'OpenSans',
  );
}

extension TxtTheme on TextStyle {
  /// fontWeight: FontWeight.bold
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  /// fontWeight: FontWeight.normal
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  /// set fontSize to [fontSize]
  TextStyle fs(double fontSize) => copyWith(fontSize: fontSize);

  /// set Color to [color]
  TextStyle cl(Color color) => copyWith(color: color);
}
