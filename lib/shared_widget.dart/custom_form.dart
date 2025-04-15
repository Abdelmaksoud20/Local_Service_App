import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.left = 12,  this.controller,
  });
  final String? hintText;
  final Widget? icon;
  final bool? obscureText;
  final double left;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: left, bottom: 10),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 18),
        obscureText: obscureText!,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: border(),
          focusedBorder: border(color: Colors.black),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.blueGrey),
          suffixIcon: icon,
        ),
      ),
    );
  }

  OutlineInputBorder border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.blueGrey),
    );
  }
}
