// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension AppThemeX on AppTheme {
  bool get isLight => this == AppTheme.Light;
  bool get isDark => this == AppTheme.Dark;
}

enum AppTheme { Light, Dark }

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.Light: ThemeData.light().copyWith(
    useMaterial3: true,
    textTheme: GoogleFonts.rajdhaniTextTheme(),
    colorScheme: const ColorScheme.light().copyWith(),

     appBarTheme: AppBarTheme(
                  centerTitle: true,
                  elevation: 0,
                  titleTextStyle: GoogleFonts.rajdhaniTextTheme()
                      .apply(
                          bodyColor: Colors.white, displayColor: Colors.white)
                    .displayMedium,
                ),
               
  ),
  AppTheme.Dark: ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark().copyWith(),
    useMaterial3: true,
    textTheme: GoogleFonts.rajdhaniTextTheme().apply(
      displayColor: Colors.white70,
      bodyColor: Colors.white,
    ),

     appBarTheme: AppBarTheme(
                  centerTitle: true,
                  elevation: 0,
                  titleTextStyle: GoogleFonts.rajdhaniTextTheme()
                      .apply(
                          bodyColor: Colors.white, displayColor: Colors.white)
                    .displayMedium,
                ),
   
    ),
};
