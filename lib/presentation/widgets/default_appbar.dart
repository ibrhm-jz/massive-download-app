import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/widgets/default_padding.dart';
import 'package:flutter_exam/theme/app_colors.dart';

enum DefaultAppbarTpye { smallCentered, small, medium, large }

enum DefaultAppbarType { fat, onScroll }

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final DefaultAppbarTpye type;
  final List<Widget>? actions;
  final bool leading;
  final void Function()? leadingFunction;
  final Widget? leadingWidget;
  const DefaultAppbar({
    super.key,
    required this.title,
    this.subtitle,
    this.type = DefaultAppbarTpye.medium,
    this.actions,
    this.leading = true,
    this.leadingFunction,
    this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.getColor(context, AppColorType.mainBackground),
      surfaceTintColor: AppColors.getColor(context, AppColorType.primary),
      toolbarHeight: _getHeight(),
      leading: leading ? _leading(context) : null,
      title: _getTitle(context),
      actions: actions,
      centerTitle: type == DefaultAppbarTpye.smallCentered,
      bottom: _getBottom(context),
    );
  }

  PreferredSize? _getBottom(BuildContext context) {
    if (type == DefaultAppbarTpye.medium || type == DefaultAppbarTpye.large) {
      return PreferredSize(
        preferredSize: const Size(100, 200),
        child: DefaultPadding(
          horizontalOnly: true,
          child: Container(
            padding: EdgeInsets.only(
                top: type == DefaultAppbarTpye.medium ? 0 : 40,
                bottom: type == DefaultAppbarTpye.medium ? 20 : 20),
            alignment: Alignment.topLeft,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: type == DefaultAppbarTpye.medium
                  ? Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color:
                          AppColors.getColor(context, AppColorType.primaryText))
                  : Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.getColor(
                          context, AppColorType.primaryText)),
            ),
          ),
        ),
      );
    }
    return null;
  }

  Widget _leading(BuildContext context) {
    return leadingWidget ??
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 8),
          child: BackButton(
            onPressed: leadingFunction,
            style: ButtonStyle(
              iconSize: WidgetStateProperty.all(30),
              fixedSize: WidgetStateProperty.all(const Size(0, 0)),
            ),
            color: AppColors.primaryColor700,
          ),
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(_getHeight());

  Widget? _getTitle(BuildContext context) {
    if (type == DefaultAppbarTpye.smallCentered ||
        type == DefaultAppbarTpye.small) {
      return Column(
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.getColor(context, AppColorType.primaryText),
                fontWeight: FontWeight.w600),
          ),
          Visibility(
            visible: subtitle != null,
            child: Text(
              overflow: TextOverflow.ellipsis,
              subtitle ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.getColor(
                      context, AppColorType.primaryText)), //Sustituir gris
            ),
          )
        ],
      );
    }
    return null;
  }

  double _getHeight() {
    switch (type) {
      case DefaultAppbarTpye.smallCentered:
      case DefaultAppbarTpye.small:
      case DefaultAppbarTpye.medium:
        return 132;
      case DefaultAppbarTpye.large:
        return 145;
      default:
        return 145;
    }
  }
}
