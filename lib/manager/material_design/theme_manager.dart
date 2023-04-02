import 'package:flutter/material.dart';
import '../responsive_manager.dart';
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
        displayLarge: StyleManager()
            .getRegularStyle(fontSize: ResponsiveManager.getSize(FontSize.s60)),
        headlineLarge: StyleManager().getRegularStyle(
          fontSize: ResponsiveManager.getSize(FontSize.s30),
        ),
        titleLarge: StyleManager().getMediumStyle(
          fontSize: ResponsiveManager.getSize(FontSize.s26),
        ),
        labelLarge: StyleManager().getMediumStyle(
          fontSize: ResponsiveManager.getSize(FontSize.s16),
        ),
        bodyLarge: StyleManager().getMediumStyle(
          fontSize: ResponsiveManager.getSize(FontSize.s12),
        ),
      ),
      colorScheme: const ColorScheme.light().copyWith(),
      appBarTheme: AppBarTheme(
        backgroundColor: const ColorScheme.light().background,
        shadowColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const ColorScheme.light().onPrimary,
          foregroundColor: Colors.black)),
  AppTheme.dark: ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark().copyWith(),
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: StyleManager().getRegularStyle(
            fontSize: ResponsiveManager.getSize(FontSize.s60),
            color: ColorManager.white),
        headlineLarge: StyleManager().getRegularStyle(
            fontSize: ResponsiveManager.getSize(FontSize.s30),
            color: ColorManager.white),
        titleLarge: StyleManager().getMediumStyle(
            fontSize: ResponsiveManager.getSize(FontSize.s26),
            color: ColorManager.white),
        labelLarge: StyleManager().getMediumStyle(
            fontSize: ResponsiveManager.getSize(FontSize.s16),
            color: ColorManager.white),
        bodyLarge: StyleManager().getMediumStyle(
            fontSize: ResponsiveManager.getSize(FontSize.s12),
            color: ColorManager.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const ColorScheme.dark().background,
        shadowColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const ColorScheme.dark().onPrimary,
          foregroundColor: Colors.white)),
};
