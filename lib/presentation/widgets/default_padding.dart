import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/utils/responsive.dart';

enum DefaultPaddingType {
  webFriendly(
    left: 20,
    top: 4,
    right: 20,
    bottom: 3,
  ),
  mobile(
    left: 10,
    top: 10,
    right: 10,
    bottom: 10,
  );

  final double top;
  final double bottom;
  final double right;
  final double left;

  const DefaultPaddingType({
    required this.top,
    required this.bottom,
    required this.right,
    required this.left,
  });
}

class DefaultPadding extends StatelessWidget {
  final bool sliver;
  final bool horizontalOnly;
  final Widget child;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final DefaultPaddingType? type;

  const DefaultPadding({
    super.key,
    required this.child,
    this.top = 16,
    this.bottom = 16,
    this.right = 16,
    this.left = 16,
    this.horizontalOnly = false,
    this.sliver = false,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    double paddingTop = top ?? 10;
    double paddingBottom = bottom ?? 10;
    double paddingRight = right ?? 16;
    double paddingLeft = left ?? 16;

    if (type != null) {
      final responsive = Responsive(context);
      paddingLeft = responsive.wp(type!.left);
      paddingRight = responsive.wp(type!.right);
      paddingBottom = responsive.wp(type!.bottom);
      paddingTop = responsive.wp(type!.top);
    }

    if (sliver) {
      return SliverPadding(
        padding: EdgeInsets.only(
          top: horizontalOnly ? 0 : paddingTop,
          bottom: horizontalOnly ? 0 : paddingBottom,
          right: paddingRight,
          left: paddingLeft,
        ),
        sliver: child,
      );
    }
    if (Platform.isWindows) {
      if (size.width < 1400) {
        return Padding(
          padding: EdgeInsets.only(
            top: horizontalOnly ? 0 : paddingTop,
            bottom: 40,
            right: 120,
            left: 120,
          ),
          child: child,
        );
      }
      return Padding(
        padding: EdgeInsets.only(
          top: horizontalOnly ? 0 : paddingTop,
          bottom: 40,
          right: 220,
          left: 220,
        ),
        child: child,
      );
    }
    return Padding(
      padding: EdgeInsets.only(
        top: horizontalOnly ? 0 : paddingTop,
        bottom: horizontalOnly ? 0 : paddingBottom,
        right: paddingRight,
        left: paddingLeft,
      ),
      child: SafeArea(child: child),
    );
  }
}
