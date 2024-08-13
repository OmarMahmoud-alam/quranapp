import 'package:flutter/material.dart';
import 'package:quranapp/core/configs/colors_manager.dart';

ThemeData themeData = ThemeData(
  buttonTheme: const ButtonThemeData(
    alignedDropdown: true,
  ),
  scaffoldBackgroundColor: ColorsManager.scaffoldBgColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorsManager.primary,
    primary: ColorsManager.primary,
  ),
  navigationBarTheme: const NavigationBarThemeData(
    height: 84,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: ColorsManager.primary,
  ),
  fontFamily: 'SF Pro Rounded',
);
