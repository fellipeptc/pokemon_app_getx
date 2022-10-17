import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

final ThemeData appThemeData = ThemeData(
  // Tipo de fonte para a aplicação
  fontFamily: 'OpenSans',
  // Estilo da fonte como tamanho e espessura
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
  // Cor de fundo do Scaffold
  scaffoldBackgroundColor: AppColors.white,
  // Cor primária do app
  primaryColor: AppColors.primary,
  // Esquema de cores para botões, filtros, brilho
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  // Campo de entrada como text_field
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: AppTextStyles.textNormalBlack14,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.border,
      ),
    ),
  ),
  // Campo de seleção como checkbox
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primary, //thereby
  ),
);
