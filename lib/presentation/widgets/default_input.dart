import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exam/theme/app_colors.dart';

enum DefaultInputType {
  normal,
  transparent,
  filled,
  dateTime,
}

class DefaultInput extends StatefulWidget {
  final DefaultInputType? type;
  final String? initValue;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onIconPressed;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final int maxLenght;
  final int maxLines;
  const DefaultInput({
    super.key,
    this.type = DefaultInputType.normal,
    this.initValue,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.controller,
    this.onIconPressed,
    this.textInputType = TextInputType.text,
    this.validator,
    this.preffixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.maxLenght = 280,
    this.maxLines = 1,
  });

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    final initText = widget.initValue != null ? widget.initValue! : '';
    _controller.text = initText;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _normalInput(context);
  }

  Widget _normalInput(BuildContext context) {
    return _ansorbingPointer(
      child: TextFormField(
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        controller: widget.controller,
        initialValue: widget.controller != null ? widget.initValue : '',
        obscureText: widget.obscureText,
        autocorrect: false,
        readOnly: widget.type == DefaultInputType.dateTime,
        enableSuggestions: true,
        keyboardType: widget.textInputType,
        onChanged: (value) {
          widget.onChanged?.call(value);
        },
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorTextStyle(),
            ),
        validator: widget.validator,
        decoration: _decoration(),
        inputFormatters: [
          LengthLimitingTextInputFormatter(
              widget.maxLenght), // Limita a 10 caracteres
        ],
      ),
    );
  }

  Color? colorTextStyle() {
    if (widget.type == DefaultInputType.filled) {
      return AppColors.getColor(context, AppColorType.primaryText);
    } else if (widget.type == DefaultInputType.transparent) {
      return AppColors.getColor(context, AppColorType.mainBackground);
    } else {
      return AppColors.getColor(context, AppColorType.primaryText);
    }
  }

  InputDecoration _decoration() {
    if (widget.type == DefaultInputType.transparent) {
      return InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: .5, horizontal: 10),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.getColor(
              context,
              AppColorType.mainBackground,
            )),
        filled: false,
        fillColor: AppColors.getColor(
          context,
          AppColorType.mainBackground,
        ),
        isCollapsed: false,
        enabledBorder: _enabledBorder(),
        focusedBorder: _focusedBorder(),
        errorBorder: _focusedErrorBorder(),
        prefixIcon: _preffixIcon(),
        suffixIcon: _suffixIcon(),
      );
    }
    if (widget.type == DefaultInputType.filled) {
      return InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: .5, horizontal: 10),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.getColor(
              context,
              AppColorType.primaryText,
            )),
        filled: true,
        fillColor: AppColors.getColor(
          context,
          AppColorType.placeholderText,
        ),
        isCollapsed: false,
        enabledBorder: _enabledBorder(),
        focusedBorder: _focusedBorder(),
        errorBorder: _focusedErrorBorder(),
        prefixIcon: _preffixIcon(),
        suffixIcon: _suffixIcon(),
      );
    } else {
      return InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: .5, horizontal: 10),
          hintText: widget.hintText,
          label: widget.labelText != null
              ? Text(
                  widget.labelText!,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.getColor(
                          context,
                          AppColorType.placeholderText,
                        ),
                      ),
                )
              : null,
          filled: true,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.getColor(
                  context,
                  AppColorType.placeholderText,
                ),
              ),
          fillColor: widget.enabled
              ? AppColors.getColor(
                  context,
                  AppColorType.mainBackground,
                )
              : const Color.fromARGB(255, 220, 220, 220),
          isCollapsed: false,
          enabledBorder: _enabledBorder(),
          focusedBorder: _focusedBorder(),
          errorBorder: _focusedErrorBorder(),
          prefixIcon: _preffixIcon(),
          suffixIcon: _suffixIcon(),
          disabledBorder: _disabledBorder());
    }
  }

  Widget _ansorbingPointer({required Widget child}) {
    if (widget.type == DefaultInputType.dateTime) {
      return GestureDetector(
        onTap: () {
          _selectdate();
        },
        child: AbsorbPointer(
          child: child,
        ),
      );
    }
    return child;
  }

  Widget? _suffixIcon() {
    if (widget.suffixIcon != null) {
      return IconButton(
          onPressed: widget.onIconPressed, icon: widget.suffixIcon!);
    } else if (widget.type == DefaultInputType.dateTime) {
      return IconButton(
        onPressed: _selectdate,
        icon: const Icon(
          Icons.calendar_month,
        ),
      );
    }
    return null;
  }

  Future<void> _selectdate() async {
    DateTime now = DateTime.now();
    DateTime? fecha = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          const Duration(days: 100 * 365),
        ),
        lastDate: DateTime(now.year + 50, now.month, now.day));

    if (fecha != null) {
      setState(() {
        widget.controller?.text = fecha.toString().split(" ")[0];
      });
      widget.onChanged?.call(fecha.toString());
    }
  }

  Widget? _preffixIcon() {
    return widget.preffixIcon != null
        ? IconButton(onPressed: widget.onIconPressed, icon: widget.preffixIcon!)
        : null;
  }

  InputBorder _enabledBorder() {
    if (widget.type == DefaultInputType.filled) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(width: .5, color: Colors.transparent),
      );
    } else {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(width: .5, color: Colors.grey),
      );
    }
  }

  InputBorder _disabledBorder() {
    if (widget.type == DefaultInputType.filled) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(width: .5, color: Colors.transparent),
      );
    } else {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(width: .5, color: Colors.grey),
      );
    }
  }

  InputBorder _focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(
        width: 1,
        color: AppColors.getColor(
          context,
          AppColorType.primary700,
        ),
      ),
    );
  }

  InputBorder _focusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(width: .5, color: Colors.red),
    );
  }
}
