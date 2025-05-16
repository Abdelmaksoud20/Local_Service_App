import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? prefixOnPressed;
  final VoidCallback? suffixOnPressed;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixOnPressed,
    this.suffixOnPressed,
    this.validator, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: kPrimaryColor),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        suffixIcon:
            suffixIcon != null
                ? IconButton(
                  onPressed: suffixOnPressed ?? () {},
                  icon: Icon(suffixIcon, color: kPrimaryColor),
                )
                : null,
        prefixIcon:
            prefixIcon != null
                ? IconButton(
                  onPressed: prefixOnPressed ?? () {},
                  icon: Icon(prefixIcon, color: kPrimaryColor),
                )
                : null,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
      ),
      validator: validator,
    );
  }
}
