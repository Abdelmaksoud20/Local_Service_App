import 'package:flutter/material.dart';
import 'package:graduation_project/shared_widget.dart/custom_drop_down_list.dart';
import 'package:graduation_project/shared_widget.dart/custom_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

class ServiceProviderForm extends StatefulWidget {
  const ServiceProviderForm({super.key});

  @override
  State<ServiceProviderForm> createState() => _ServiceProviderFormState();
}

class _ServiceProviderFormState extends State<ServiceProviderForm> {
  bool? obscureText = true;

  @override
  Widget build(BuildContext context) {
    double left = 5;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextForm(title: 'Full name'),
          CustomForm(hintText: 'Enter your name', left: left),
          CustomTextForm(title: 'Email'),
          CustomForm(hintText: 'expamle@gmail.com', left: left),
          CustomTextForm(title: 'Area'),
          CustomDropdownListLocation(),
          CustomTextForm(title: 'The service your provide'),
          CustomForm(left: left),
          CustomTextForm(title: 'Skils'),
          CustomForm( left: left),
          CustomTextForm(title: 'Phone Number'),
          CustomForm(hintText: '0121 234 5678', left: left),
          CustomTextForm(title: 'Password'),
          CustomForm(
            left: left,
            obscureText: obscureText,
            hintText: 'password',
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
            SizedBox(
            height: 15,
          ),
          PrimaryButton(title: 'Register',radius: 15,onPressed: (){
            //!HomePagetoServiceProvider
          },),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}


