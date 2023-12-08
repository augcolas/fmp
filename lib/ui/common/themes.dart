import 'package:flutter/material.dart';
import 'package:fmp/ui/common/app_colors.dart';

ThemeData light = ThemeData.light().copyWith(
  scaffoldBackgroundColor: kcVeryLightGrey,
  primaryColor: kcPrimaryColorLight,
  hintColor: kcAccentColorLight,
  cardColor: kcVeryLightGrey,
  textTheme: const TextTheme(
    titleLarge:   TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kcTextDark),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kcTextLight),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kcTextLight),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: kcTextLight),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: kcAccentColorLight),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kcPrimaryColorLight,
      backgroundColor: kcAccentColorLight,
    ),
  ),
);

ThemeData dark = ThemeData.light().copyWith(
  scaffoldBackgroundColor: kcVeryDarkGrey,
  primaryColor: kcPrimaryColorDark,
  hintColor: kcAccentColorDark,
  cardColor: kcVeryDarkGrey,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kcTextDark),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kcTextDark),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kcTextDark),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: kcTextDark),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: kcAccentColorDark),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kcPrimaryColorDark,
      backgroundColor: kcAccentColorDark,
    ),
  ),
);
