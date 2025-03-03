
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

    static ThemeData darkTheme = ThemeData.dark().copyWith(
    extensions: <ThemeExtension>[
      ZappColors(
        neutral100: AppColors.neutral100,
        primary: AppColors.darkColors[AppColorType.primary],
        primaryDark: AppColors.darkColors[AppColorType.primaryDark],
        secondary: AppColors.darkColors[AppColorType.secondary],
        mainBackground: AppColors.darkColors[AppColorType.mainBackground],
        secondaryBackground:
            AppColors.darkColors[AppColorType.secondaryBackground],
        primaryText: AppColors.darkColors[AppColorType.primaryText],
        secondaryText: AppColors.darkColors[AppColorType.secondaryText],
        placeholderText: AppColors.darkColors[AppColorType.placeholderText],
        borderAndDivider: AppColors.darkColors[AppColorType.divider],
        alert: AppColors.darkColors[AppColorType.alert],
        success: AppColors.darkColors[AppColorType.success],
      )
    ],
    brightness: Brightness.dark,
    primaryColor: AppColors.darkColors[AppColorType.primary],
    scaffoldBackgroundColor: AppColors.darkColors[AppColorType.mainBackground],
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkColors[AppColorType.primary]!,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 34,
        color: AppColors.darkColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 32,
        color: AppColors.darkColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 30,
        color: AppColors.darkColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 26,
        color: AppColors.darkColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 25,
        color: AppColors.darkColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 24,
        color: AppColors.darkColors[AppColorType.primaryText],
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 28,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
      titleMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 20,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
      titleSmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 18,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
      bodyLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 16,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
      bodyMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 14,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
      bodySmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 13,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
      labelLarge: TextStyle(
        fontFamily: primaryFont,
        fontSize: 12,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
      labelMedium: TextStyle(
        fontFamily: primaryFont,
        fontSize: 11,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
      labelSmall: TextStyle(
        fontFamily: primaryFont,
        fontSize: 10,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkColors[AppColorType.mainBackground],
      foregroundColor: AppColors.darkColors[AppColorType.primaryText],
      shadowColor: AppColors.darkColors[AppColorType.mainBackground],
      surfaceTintColor: AppColors.darkColors[AppColorType.mainBackground],
      scrolledUnderElevation: 0,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: primaryFont,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkColors[AppColorType.primaryText],
      ),
    ),
    primaryIconTheme: IconThemeData(
      color: AppColors.darkColors[AppColorType.primary],
      size: 16,
    ),
    iconTheme: IconThemeData(
      color: AppColors.darkColors[AppColorType.primary],
      size: 16,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkColors[AppColorType.primaryText],
      foregroundColor: AppColors.darkColors[AppColorType.secondary],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkColors[AppColorType.secondary],
      selectedIconTheme: IconThemeData(
        color: AppColors.darkColors[AppColorType.primary],
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppColors.neutral0,
      ),
    ),
    cardTheme: const CardTheme(color: AppColors.neutral100, elevation: 0),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.darkColors[AppColorType.primary],
      labelStyle: TextStyle(
        color: AppColors.darkColors[AppColorType.mainBackground]!,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(
          color: AppColors.darkColors[AppColorType.secondary]!,
          width: 0,
        ),
      ),
    ),
  );
}
