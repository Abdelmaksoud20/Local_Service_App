import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/models/request_button_model.dart';
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
    // TextEditingController dateController = TextEditingController();
  String? area;
  late final RequestButtonModel data;
  @override
  void initState() {
    data = RequestButtonModel();
    super.initState();
  }

  @override
  void dispose() {
    data.disposeAll();
    super.dispose();
  }

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
            controller: data.nameController,
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
            controller: data.emailController,
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
            controller: data.mobileController,
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
            key: data.dropDownKey,
            color: kPrimaryColor,
            data: [
              'Al Zohour District',
              'Al-talatini District',
              'Al Manakh District',
              'South District',
              'East Port Said District',
              'Al-dowahi District',
              'West District',
            ],
            // Al Manakh District,Al Zohour District,Al-talatini District,South District,East Port Said District,Al-dowahi District,West District
            hintText: 'Area',
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: data.addressController,
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
            controller: data.executionDayController,
            labelText: 'The Execution Day:ex 2025-05-20',
            prefixIcon: Icons.calendar_month,
            onTap: () async {
              await showAndChooseDate(context);
            },
            
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
          data: data,
            service: widget.service,
            price: widget.price,
            skill: widget.skill,
          
          ),
        ],
      ),
    );
  }

  Future<void> showAndChooseDate(BuildContext context) async {
      DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    
                );
      if (pickedDate != null) {
    String formattedDate = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      setState(() {
      data.executionDayController.text = formattedDate;
    });
      }
  }
}
