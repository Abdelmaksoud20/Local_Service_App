import 'package:flutter/material.dart';
import 'package:graduation_project/models/form_field_model.dart';
import 'package:graduation_project/shared_widget.dart/custom_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form.dart';

class CustomNameAndUsername extends StatefulWidget {
  const CustomNameAndUsername({
    super.key,
    required this.left,
    required this.controllerFirst,
    required this.controllerLast,
    required this.controllerUser,
  });
  final double left;
  final TextEditingController controllerFirst;
  final TextEditingController controllerLast;
  final TextEditingController controllerUser;
  @override
  State<CustomNameAndUsername> createState() => _CustomNameAndUsernameState();
}

class _CustomNameAndUsernameState extends State<CustomNameAndUsername> {
  String? firstName;
  String? lastName;
  String? userName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextForm(title: 'First Name'),
        CustomForm(
          formModel: FormFieldModel(
            controller: widget.controllerFirst,
            left: widget.left,
            hintText: 'Enter your FirstName',
            keyboardType: TextInputType.name,
            onchanged: (data) {
              firstName = data;
            },
            validate: (data) {
              if (data!.isEmpty) {
                return 'First Name is required';
              } else if (data.length < 3) {
                return 'First Name must be at least 3 characters long';
              } else {
                return null;
              }
            },
          ),
        ),
        CustomTextForm(title: 'Last Name'),
        CustomForm(
          formModel: FormFieldModel(
            controller: widget.controllerLast,
            hintText: 'Enter your LastName',
            keyboardType: TextInputType.name,
            left: widget.left,
            onchanged: (data) {
              lastName = data;
            },
            validate: (data) {
              if (data!.isEmpty) {
                return 'Last Name is required';
              } else if (data.length < 3) {
                return 'Last Name must be at least 3 characters long';
              } else {
                return null;
              }
            },
          ),
        ),
        CustomTextForm(title: 'User Name'),
        CustomForm(
          formModel: FormFieldModel(
            controller: widget.controllerUser,
            hintText: 'Enter your UserName',
            keyboardType: TextInputType.name,
            left: widget.left,
            onchanged: (data) {
              userName = data;
            },
            validate: (data) {
              if (data!.isEmpty) {
                return 'User Name is required';
              } else if (data.length < 3) {
                return 'User Name must be at least 3 characters long';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
