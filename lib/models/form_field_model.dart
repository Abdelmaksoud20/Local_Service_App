import 'package:flutter/material.dart';

class FormFieldModel {
  final String? hintText;
  final Widget? icon;
  final bool? obscureText;
  final double left;
  final TextEditingController? controller;
  final Function(String)? onchanged;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? Function(String?)? validate;

  FormFieldModel( {
    this.validate,
    this.errorText,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.left = 12,
    this.controller,
    this.onchanged,
    this.keyboardType,
  });
}
