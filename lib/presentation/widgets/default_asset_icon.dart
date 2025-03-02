import 'package:flutter/material.dart';
import 'package:flutter_exam/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAssetIcon extends StatelessWidget {
  final String asset;
  final Color? color;
  final double width;
  final double height;
  final bool original;

  const DefaultAssetIcon({
    required this.asset,
    this.color,
    this.width = 24,
    this.height = 24,
    this.original = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      colorFilter: _filter(context),
    );
  }

  ColorFilter? _filter(BuildContext context) {
    if (original) return null;
    return (color == null)
        ? ColorFilter.mode(
            AppColors.getColor(context, AppColorType.primary),
            BlendMode.srcIn,
          )
        : ColorFilter.mode(color!, BlendMode.srcIn);
  }
}
