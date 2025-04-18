import 'package:flutter/material.dart';
import 'package:graduation_project/models/form_field_model.dart';
import 'package:graduation_project/shared_widget.dart/custom_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form.dart';

class CustomEmailAndPhone extends StatefulWidget {
  const CustomEmailAndPhone({super.key, required this.left, required this.controllerEmail, required this.controllerPhone});
  final double left;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPhone;
  @override
  State<CustomEmailAndPhone> createState() => _CustomEmailAndPhoneState();
}

class _CustomEmailAndPhoneState extends State<CustomEmailAndPhone> {
  String? email;
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextForm(title: 'Email'),
        CustomForm(
          formModel: FormFieldModel(
            controller: widget.controllerEmail,
            onchanged: (email) {
              this.email = email;
            },
            hintText: 'exapmle@gmail.com',
            left: widget.left,
            keyboardType: TextInputType.emailAddress,
            validate: (data) {
              if (data!.isEmpty) {
                return 'Email is required';
              } else if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(data)) {
                return 'Invalid email format';
              }
              return null;
            },
          ),
        ),
        CustomTextForm(title: 'Phone Number'),
        CustomForm(
          formModel: FormFieldModel(
            controller: widget.controllerPhone,
            onchanged: (phone) {
              phoneNumber = phone;
            },
            hintText: '+201234567891',
            left: widget.left,
            keyboardType: TextInputType.phone,
            validate: (data) {
              if (data!.isEmpty) {
                return 'Phone Number is required';
              } else if (!RegExp(r'^\+?\d{10,15}$').hasMatch(data)) {
                return 'Invalid phone number format';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}