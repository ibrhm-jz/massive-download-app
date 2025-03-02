import 'dart:io';

import 'package:flutter/material.dart';

///
/// [ResponsiveLayout.]
///
/// [@author	Ibraham Jimenez]
/// [ @since	v0.0.1 ] Acepta dos widgets, unos se mostrara en la versión web y otro en mobile.
/// [@version	v1.0.0	Monday, June 17th, 2024]
/// [@see		StatelessWidget]
/// [@global]
///
class ResponsiveLayout extends StatelessWidget {
  final Widget? desktop;

  final Widget mobile;
  const ResponsiveLayout({
    super.key,
    this.desktop,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (!Platform.isWindows) return mobile;
        if (constrains.maxWidth < 600) {
          return mobile;
        } else {
          return desktop ?? mobile;
        }
      },
    );
  }
}