import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusColor: colors.primary,
        enabledBorder: border,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: colors.error)),
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: colors.error)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        prefixIcon: Icon(
          Icons.supervised_user_circle_rounded,
          color: colors.primary,
        ),
        errorText: errorMessage,
        // suffixIcon: Icon(
        //   Icons.supervised_user_circle_rounded,
        //   color: colors.primary,
        // ),
        // icon: Icon(
        //   Icons.supervised_user_circle_rounded,
        //   color: colors.primary,
        // ),
      ),
    );
  }
}
