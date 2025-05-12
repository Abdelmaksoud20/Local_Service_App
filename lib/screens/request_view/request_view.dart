import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../shared_widget.dart/custom_text_form_field.dart';

class RequestView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController executionDayController = TextEditingController();

  RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
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
                    final emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email';
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
                    final phoneRegex = RegExp(r"^\d{10}$"); // 10 digits
                    if (!phoneRegex.hasMatch(value)) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  controller: areaController,
                  labelText: 'Area',
                  suffixIcon: Icons.list,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the area';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Request')),
                          );

                          formKey.currentState!.reset();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Please correct the errors and try again')),
                          );
                        }
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.sizeOf(context).width *.8,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            'Request',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
