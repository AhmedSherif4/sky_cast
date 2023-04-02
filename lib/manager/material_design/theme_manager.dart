import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';


extension AppThemeX on AppTheme {
  bool get isLight => this == AppTheme.light;
  bool get isDark => this == AppTheme.dark;
}

enum AppTheme { light, dark }

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: StyleManager().getSemiBoldStyle(fontSize: FontSize.s22),
      headlineLarge: StyleManager().getRegularStyle(fontSize: FontSize.s20),
      titleLarge: StyleManager().getMediumStyle(fontSize: FontSize.s18),
      labelLarge: StyleManager().getMediumStyle(fontSize: FontSize.s16),
      bodyLarge: StyleManager().getMediumStyle(fontSize: FontSize.s14),
    ),
    colorScheme: const ColorScheme.light().copyWith(),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
  ),
  AppTheme.dark: ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark().copyWith(),
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: StyleManager().getSemiBoldStyle(fontSize: FontSize.s22, color: ColorManager.white),
      headlineLarge: StyleManager().getRegularStyle(fontSize: FontSize.s20, color: ColorManager.white),
      titleLarge: StyleManager().getMediumStyle(fontSize: FontSize.s18, color: ColorManager.white),
      labelLarge: StyleManager().getMediumStyle(fontSize: FontSize.s16, color: ColorManager.white),
      bodyLarge: StyleManager().getMediumStyle(fontSize: FontSize.s14, color: ColorManager.white),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
  ),
};
 