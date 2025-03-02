
import 'package:flutter/material.dart';
import 'package:flutter_exam/theme/app_colors.dart';
import 'package:flutter_exam/theme/extension.dart';

class ThemeClass {
  static const String primaryFont = 'Aveniir';
  static ThemeData lightTheme = ThemeData.light().copyWith(
    extensions: <ThemeExtension>[
      ZappColors(
        neutral100: AppColors.neutral100,
        primary: AppColors.lightColors[AppColorType.primary],
        primaryDark: AppColors.lightColors[AppColorType.primaryDark],
        secondary: AppColors.lightColors[AppColorType.secondary],
        mainBackground: AppColors.lightColors[AppColorType.mainBackground],
        secondaryBackground:
            AppColors.lightColors[AppColorType.secondaryBackground],
        primaryText: AppColors.lightColors[AppColorType.primaryText],
        secondaryText: AppColors.lightColors[AppColorType.secondaryText],
        placeholderText: AppColors.lightColors[AppColorType.placeholderText],
        borderAndDivider: AppColors.lightColors[AppColorType.divider],
        alert: AppColors.lightColors[AppColorType.alert],
        success: AppColors.lightColors[AppColorType.success],
      )
    ],
    brightness: Brightness.light,
    primaryColor: AppColors.lightColors[AppColorType.primary],
    scaffoldBackgroundColor: AppColors.lightColors[AppColorType.mainBackground],
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightColors[AppColorType.primary]!,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 34,
        color: AppColors.lightColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 32,
        color: AppColors.lightColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 30,
        color: AppColors.lightColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 26,
        color: AppColors.lightColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 25,
        color: AppColors.lightColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 24,
        color: AppColors.lightColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 28,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
      titleMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 20,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
      titleSmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 18,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
      bodyLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 16,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
      bodyMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 14,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
      bodySmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 13,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
      labelLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 12,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
      labelMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 11,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
      labelSmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 10,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightColors[AppColorType.mainBackground],
      foregroundColor: AppColors.lightColors[AppColorType.primaryText],
      // foregroundcolor: AppColors.lightColors[AppColorType.primaryText] ,
      shadowColor: AppColors.lightColors[AppColorType.mainBackground],
      surfaceTintColor: AppColors.lightColors[AppColorType.mainBackground],
      scrolledUnderElevation: 0,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: primaryFont,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.lightColors[AppColorType.primaryText],
      ),
    ),
    primaryIconTheme: IconThemeData(
      color: AppColors.lightColors[AppColorType.primary],
      size: 16,
    ),
    iconTheme: IconThemeData(
      color: AppColors.lightColors[AppColorType.primary],
      size: 16,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightColors[AppColorType.primaryText],
      foregroundColor: AppColors.lightColors[AppColorType.secondary],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightColors[AppColorType.secondary],
      selectedIconTheme: IconThemeData(
        color: AppColors.lightColors[AppColorType.primary],
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppColors.neutral0,
      ),
    ),
    cardTheme: const CardTheme(color: AppColors.neutral100, elevation: 0),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightColors[AppColorType.primary],
      labelStyle: TextStyle(
        color: AppColors.lightColors[AppColorType.mainBackground]!,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(
          color: AppColors.lightColors[AppColorType.secondary]!,
          width: 0,
        ),
      ),
    ),
  );
}
