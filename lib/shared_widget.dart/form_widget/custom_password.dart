import 'package:flutter/material.dart';
import 'package:graduation_project/models/form_field_model.dart';
import 'package:graduation_project/shared_widget.dart/custom_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form.dart';

class CustomPassword extends StatefulWidget {
  const CustomPassword({
    super.key,
    required this.left,
    required this.controllerpassword,
    required this.controllerconfirm,
  });
  final double left;
  final TextEditingController controllerpassword;
  final TextEditingController controllerconfirm;
  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool? obscureText = true;
  bool? obscureTextConfirm = true;
  dynamic password;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextForm(title: 'Password'),
        CustomForm(
          formModel: FormFieldModel(
            onchanged: (data) {
              password = data;
            },
            controller: widget.controllerpassword,
            hintText: 'Password',
            left: widget.left,
            obscureText: obscureText,
            validate: (data) {
              if (data!.isEmpty) {
                return 'Password is required';
              } else if (data.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
            icon: IconButton(
              onPressed: () {
                obscureText = !obscureText!;
                setState(() {});
              },
              icon: Icon(
                obscureText! ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
        CustomTextForm(title: 'Confirm Password'),
        CustomForm(
          formModel: FormFieldModel(
            controller: widget.controllerconfirm,
            hintText: 'Confirm Password',
            left: widget.left,
            obscureText: obscureTextConfirm,
            validate: (data) {
              if (data!.isEmpty) {
                return 'Confirm Password is required';
              } else if (data != password) {
                return 'Password does not match';
              }
              return null;
            },
            icon: IconButton(
              onPressed: () {
                obscureTextConfirm = !obscureTextConfirm!;
                setState(() {});
              },
              icon: Icon(
                obscureTextConfirm! ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ],
    );
  }
}