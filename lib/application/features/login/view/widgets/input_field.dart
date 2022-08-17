import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final bool isPassword;
  final bool hasIcon;
  final bool isPasswordVisible;
  final TextInputType keyboard;
  final String hint;
  final String? label;
  final void Function(String)? onChanged;
  final VoidCallback? onIconPressed;
  final String? error;
  final TextStyle? labelStyle;
  final IconData? icon;
  final int? maxLines;

  const InputField({
    Key? key,
    this.icon,
    this.error,
    this.label,
    this.onChanged,
    this.hint = '',
    this.isPassword = false,
    this.hasIcon = false,
    this.isPasswordVisible = false,
    this.labelStyle,
    this.onIconPressed,
    this.keyboard = TextInputType.text,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: labelStyle ?? Theme.of(context).textTheme.headline4,
          ),
          TextFormField(
            style: Theme.of(context).textTheme.headline6,
            onChanged: onChanged,
            keyboardType: keyboard,
            maxLines: maxLines,
            obscureText: (isPassword) ? !isPasswordVisible : false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              errorText: error,
              errorStyle: const TextStyle(fontSize: 14),
              suffixIcon: (hasIcon)
                  ? IconButton(onPressed: onIconPressed, icon: Icon(icon))
                  : null,
              helperText: hint,
              helperMaxLines: 2,
              errorMaxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
