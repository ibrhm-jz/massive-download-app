import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class Responsive {
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  double _width = 0, _height = 0, _diagonal = 0, _heightWithAppBar = 0;
  double _paddingTop = 0, _paddingBottom = 0;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  double get paddingTop => _paddingTop;
  double get paddingBottom => _paddingBottom;
  double get heightWithAppBar => _heightWithAppBar;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;

    _width = size.width;
    _height = size.height;
    _paddingTop = mediaQuery.padding.top;
    _paddingBottom = mediaQuery.padding.bottom;
    _heightWithAppBar = size.height - preferredSize.height;
    _diagonal = math.sqrt(
      math.pow(_width, 2) + math.pow(_height, 2),
    );
  }

  /// Obtener un procentaje del ancho de la pantalla
  double wp(double percent) => _width * percent / 100;

  /// Obtener un procentaje del alto de la pantalla
  double hp(double percent) => _height * percent / 100;

  /// Obtener un procentaje de la diagonal de la pantalla
  double dp(double percent) => _diagonal * percent / 100;

  double hpAb(double percent) =>
      (_heightWithAppBar - preferredSize.height) * percent / 100;

  /// Obtener si el porcentaje de pantalla es para verse en web o movil
  bool get isDesktop => Platform.isWindows && _width > 700;

  /// Método para quitar un porcentaje del ancho
  void subtractWidthPercentage(double percent) {
    _width -= _width * percent / 100;
    _width = _width < 0 ? 0 : _width;
  }
}
