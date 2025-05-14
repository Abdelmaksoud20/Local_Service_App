import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/screens/request_view/request_button.dart';
import 'package:graduation_project/shared_widget.dart/custom_drop_down_list.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form_field.dart';

class FormRequest extends StatefulWidget {
  const FormRequest({
    super.key,
    required this.price,
    required this.skill,
    required this.service,
  });
  final String price, skill, service;
  @override
  State<FormRequest> createState() => _FormRequestState();
}

class _FormRequestState extends State<FormRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController areaController = TextEditingController();

  final TextEditingController executionDayController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final GlobalKey<CustomDropdownListState> dropDownKey = GlobalKey<CustomDropdownListState>();


  String? area;
  @override
  Widget build(BuildContext context) {
    // log('request form');
    return Form(
      key: formKey,
      child: ListView(
        children: [
          Image.asset(
            'assets/images/Vector_x.png',
            height: 100,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '“Confirm Your Request”',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Please fill out the form below:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: nameController,
            labelText: 'Full Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            controller: emailController,
            labelText: 'Email',
            prefixIcon: Icons.mail,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            controller: mobileController,
            labelText: 'Mobile',
            prefixIcon: Icons.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              final phoneRegex = RegExp(r"^\d{11}$"); // 10 digits
              if (!phoneRegex.hasMatch(value)) {
                return 'Enter a valid phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomDropdownList(
            key: dropDownKey,
            onChanged: (value) {
              setState(() {
                area = value;
              });
            },
            color: kPrimaryColor,
            data: [
              'Al-Sharq District',
              'Al-Arab District',
              'Al-Manakh District',
              'Al-Dawahi District',
              'Al-Zohour District',
              'Al-Janoub District',
              'Al-Gharb District',
            ],
            hintText: 'Area',
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: addressController,
            labelText: 'Enter Your Problem Address',

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Your Problem Address ';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            controller: executionDayController,
            labelText: 'Select The Execution Day',
            prefixIcon: Icons.calendar_month,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select the execution day';
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          RequestButton(
            formKey: formKey,
            nameController: nameController,
            emailController: emailController,
            mobileController: mobileController,
            addressController: addressController,
            executionDayController: executionDayController,
            service: widget.service,
            price: widget.price,
            skill: widget.skill,
            dropDownKey: dropDownKey,
          ),
        ],
      ),
    );
  }
}