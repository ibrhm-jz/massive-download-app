import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/utils/responsive.dart';
import 'package:flutter_exam/theme/app_colors.dart';

enum DefaultButtonType { primary, secondary, text, tertiary, analogus, triadic }

class DefaultButton extends StatelessWidget {
  final DefaultButtonType type;
  final String text;
  final bool icon;
  final bool enable;
  final bool expanded;
  final IconData? remplaceIcon;
  final VoidCallback? onPressed;
  const DefaultButton({
    super.key,
    this.type = DefaultButtonType.primary,
    required this.text,
    this.icon = false,
    this.enable = true,
    required this.onPressed,
    this.expanded = true,
    this.remplaceIcon,
  });

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    const Color neutral = AppColors.neutral100;
    Color textColor = AppColors.neutral100;
    Color backgroundColor = AppColors.getColor(context, AppColorType.primary);
    BorderSide side = BorderSide.none;
    double? elevation;
    Color? surfaceTintColor;
    Color? foregroundColor;
    if (type == DefaultButtonType.secondary) {
      elevation = 0;
      textColor = AppColors.getColor(context, AppColorType.primary);
      backgroundColor =
          AppColors.getColor(context, AppColorType.mainBackground);
      side = BorderSide(
          color: AppColors.getColor(context, AppColorType.border), width: .5);
      surfaceTintColor = neutral;
      //foregroundColor = AppColors.hoverPrimary8;
    }

    if (type == DefaultButtonType.text) {
      textColor = AppColors.getColor(context, AppColorType.primary);
      backgroundColor = Colors.transparent;
      foregroundColor =
          AppColors.getColor(context, AppColorType.mainBackground);
      surfaceTintColor =
          AppColors.getColor(context, AppColorType.mainBackground);
      elevation = 0;
    }

    if (type == DefaultButtonType.tertiary) {
      textColor = neutral;
      backgroundColor = AppColors.getColor(context, AppColorType.success);
      elevation = 0;
    }
    if (type == DefaultButtonType.analogus) {
     textColor = AppColors.neutral100;
      backgroundColor = AppColors.getColor(context, AppColorType.alert);
      elevation = 0;
    }
    if (type == DefaultButtonType.triadic) {
      textColor = AppColors.neutral100;
      backgroundColor = AppColors.triadic2;
      elevation = 0;
    }
    if (!enable) {
      elevation = 0;
      backgroundColor = AppColors.getColor(context, AppColorType.primary200);
      textColor = AppColors.getColor(context, AppColorType.primary700);
    }
    return Opacity(
      opacity: enable ? 1 : .38,
      child: AbsorbPointer(
        absorbing: !enable,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: responsive.hp(5)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              surfaceTintColor: surfaceTintColor,
              foregroundColor: foregroundColor,
              side: side,
              elevation: elevation,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getIcon(icon: icon, color: textColor),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: textColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getIcon({required bool icon, required Color color}) {
    if (!icon) return const SizedBox();

    return Row(
      children: [
        Icon(
          remplaceIcon ?? Icons.add,
          color: color,
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
