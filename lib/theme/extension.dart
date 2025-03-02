import 'package:flutter/material.dart';

@immutable
class ZappColors extends ThemeExtension<ZappColors> {
  const ZappColors({
    required this.neutral100,
    required this.primary,
    required this.primaryDark,
    required this.secondary,
    required this.mainBackground,
    required this.secondaryBackground,
    required this.primaryText,
    required this.secondaryText,
    required this.placeholderText,
    required this.borderAndDivider,
    required this.alert,
    required this.success,
  });
  final Color? neutral100;
  final Color? primary;
  final Color? primaryDark;
  final Color? secondary;
  final Color? mainBackground;
  final Color? secondaryBackground;
  final Color? primaryText;
  final Color? secondaryText;
  final Color? placeholderText;
  final Color? borderAndDivider;
  final Color? alert;
  final Color? success;

  @override
  ZappColors copyWith({
    Color? neutral100,
    Color? primary,
    Color? primaryDark,
    Color? secondary,
    Color? mainBackground,
    Color? secondaryBackground,
    Color? primaryText,
    Color? secondaryText,
    Color? placeholderText,
    Color? borderAndDivider,
    Color? alert,
    Color? success,
  }) {
    return ZappColors(
      neutral100: neutral100 ?? this.neutral100,
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      secondary: secondary ?? this.secondary,
      mainBackground: mainBackground ?? this.mainBackground,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      placeholderText: placeholderText ?? this.placeholderText,
      borderAndDivider: borderAndDivider ?? this.borderAndDivider,
      alert: alert ?? this.alert,
      success: success ?? this.success,
    );
  }

  @override
  ZappColors lerp(ZappColors? other, double t) {
    if (other is! ZappColors) {
      return this;
    }
    return ZappColors(
      neutral100: Color.lerp(neutral100, other.neutral100, t),
      primary: Color.lerp(primary, other.primary, t),
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      mainBackground: Color.lerp(mainBackground, other.mainBackground, t),
      secondaryBackground:
          Color.lerp(secondaryBackground, other.secondaryBackground, t),
      primaryText: Color.lerp(primaryText, other.primaryText, t),
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t),
      placeholderText: Color.lerp(placeholderText, other.placeholderText, t),
      borderAndDivider: Color.lerp(borderAndDivider, other.borderAndDivider, t),
      alert: Color.lerp(alert, other.alert, t),
      success: Color.lerp(success, other.success, t),
    );
  }
}
