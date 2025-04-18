import 'package:flutter/material.dart';
import 'package:graduation_project/models/form_field_model.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({super.key, required this.formModel});
  final FormFieldModel formModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: formModel.left, bottom: 10),
      child: TextFormField(
        validator: formModel.validate,
        forceErrorText: formModel.errorText,
        keyboardType: formModel.keyboardType,
        onChanged: formModel.onchanged,
        controller: formModel.controller,
        style: TextStyle(fontSize: 18),
        obscureText: formModel.obscureText!,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: border(),
          enabledBorder: border(),
          focusedBorder: border(color: Colors.black),
          hintText: formModel.hintText,
          hintStyle: TextStyle(color: Colors.blueGrey),
          suffixIcon: formModel.icon,
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
