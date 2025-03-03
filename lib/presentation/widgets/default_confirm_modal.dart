import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/presentation/utils/responsive.dart';
import 'package:flutter_exam/presentation/widgets/default_button.dart';
import 'package:flutter_exam/theme/app_colors.dart';

enum DefaultConfirmModalType { confirm, deleted, success }

class DefaultConfirmModal extends StatelessWidget {
  final VoidCallback onPressed;
  final String? titleText;
  final String? subTitleText;
  final DefaultConfirmModalType type;
  const DefaultConfirmModal(
      {super.key,
      required this.onPressed,
      required this.titleText,
      this.subTitleText =
          'Si elimina este dato, no se podra volver a recuperarlo.',
      this.type = DefaultConfirmModalType.confirm});

  @override
  Widget build(BuildContext context) {
    String buttonText = "Continuar";
    DefaultButtonType buttonType = DefaultButtonType.primary;
    if (type == DefaultConfirmModalType.confirm) {}
    if (type == DefaultConfirmModalType.deleted) {
      buttonText = "Continuar";
      buttonType = DefaultButtonType.analogus;
    }
    if (type == DefaultConfirmModalType.success) {
      buttonText = "Aceptar";
    }
    Responsive responsive = Responsive(context);
    return AlertDialog(
      backgroundColor: AppColors.getColor(context, AppColorType.mainBackground),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(20),
      content: SizedBox(
        width: responsive.isDesktop ? responsive.wp(28) : responsive.width,
        child: Padding(
          padding: responsive.isDesktop
              ? const EdgeInsets.symmetric(vertical: 5, horizontal: 20)
              : const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Text(
                subTitleText.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      actionsOverflowDirection: VerticalDirection.up,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: type != DefaultConfirmModalType.success,
              child: Expanded(
                child: DefaultButton(
                  type: DefaultButtonType.secondary,
                  text: "Cancelar",
                  onPressed: () {
                    AutoRouter.of(context).popForced();
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DefaultButton(
                type: buttonType,
                text: buttonText,
                onPressed: () {
                  onPressed.call();
                  AutoRouter.of(context).popForced();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
