import 'package:flutter/material.dart';

// Enum to define the types of colors available
enum AppColorType {
  primary,
  primary200,
  primary700,
  primaryDark,
  secondary,
  mainBackground,
  secondaryBackground,
  primaryText,
  secondaryText,
  placeholderText,
  divider,
  border,
  alert,
  success,
  warning
}

class AppColors {
  static const Color neutral0 = Color(0xFF000000);
  static const Color neutral30 = Color(0xFF4D4D4D);
  static const Color neutral50 = Color(0xFF808080);
  static const Color neutral80 = Color(0xFFCCCCCC);
  static const Color neutral90 = Color(0xFFE6E6E6);
  static const Color neutral95 = Color(0xFFF2F2F2);
  static const Color neutral97 = Color(0xFFF7F7F7);
  static const Color neutral100 = Color(0xFFFFFFFF);

  static const Color complementary = Color(0xFFF9F871);
  static const Color analogus = Color(0xFF007AF7);
  static const Color triadic1 = Color(0xFFe861db);
  static const Color triadic2 = Color(0xFFe86e61);

  static const Color primaryColor50 = Color(0xFFEFF0FE);
  static const Color primaryColor100 = Color(0xFFE2E5FD);
  static const Color primaryColor200 = Color(0xFFCACEFB);
  static const Color primaryColor300 = Color(0xFFAAADF7);
  static const Color primaryColor400 = Color(0xFF8a87f2);
  static const Color primaryColor500 = Color(0xFF6F61E8);
  static const Color primaryColor600 = Color(0xFF694FDC);
  static const Color primaryColor700 = Color(0xFF5A40C2);
  static const Color primaryColor800 = Color(0xFF49369d);
  static const Color primaryColor900 = Color(0xFF3E327D);
  static const Color primaryColor950 = Color(0xFF251E48);
  
  static const Map<AppColorType, Color> lightColors = {
    AppColorType.primary: Color(0xFF6f61e8),
    AppColorType.primary200: Color(0xFFc6def7),
    AppColorType.primary700: Color(0xFF325ec3),
    AppColorType.primaryDark: Color.fromARGB(255, 24, 35, 66),
    AppColorType.secondary: Color(0xFF71A6FF),
    AppColorType.mainBackground: Color.fromARGB(255, 242, 242, 242),
    AppColorType.secondaryBackground: Color(0xFFEFEFEF),
    AppColorType.primaryText: Color(0xFF0D1C0D),
    AppColorType.secondaryText: Color(0xFF55608E),
    AppColorType.placeholderText: Color(0xFF8E8E93),
    AppColorType.divider: Color(0xFFE8F2E8),
    AppColorType.border: Color(0xFFD0D5DD),
    AppColorType.alert: Color(0xFFFF3B30),
    AppColorType.success: Color.fromARGB(255, 32, 154, 63),
    AppColorType.warning: Color.fromARGB(255, 174, 185, 11),
  };

  static const Map<AppColorType, Color> darkColors = {
    AppColorType.primary: Color(0xFF93C893),
    AppColorType.primary200: Color(0xFFc6def7),
    AppColorType.primary700: Color(0xFF325ec3),
    AppColorType.primaryDark: Color(0xFF93C893),
    AppColorType.secondary: Color(0xFF1AE51A),
    AppColorType.mainBackground: Color(0xFF112211),
    AppColorType.secondaryBackground: Color(0xFF1A321A),
    AppColorType.primaryText: Color(0xFFFFFFFF),
    AppColorType.secondaryText: Color(0xFF478A47),
    AppColorType.placeholderText: Color(0xFF8E8E93),
    AppColorType.divider: Color(0xFF244724),
    AppColorType.border: Color(0xFFD0D5DD),
    AppColorType.alert: Color(0xFFFF453A),
    AppColorType.success: Color(0xFF30D158),
    AppColorType.warning: Color.fromARGB(255, 174, 185, 11),
  };

  static Color getColor(BuildContext context, AppColorType colorType) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkColors[colorType]!
        : lightColors[colorType]!;
  }
}
