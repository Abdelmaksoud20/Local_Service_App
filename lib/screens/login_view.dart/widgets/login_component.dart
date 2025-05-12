import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/models/form_field_model.dart';
import 'package:graduation_project/shared_widget.dart/custom_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

import '../../home_views/home_view.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  bool? obscureText = true;
  TextEditingController? controller = TextEditingController();
  TextEditingController? controllerpassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          CustomTextForm(title: 'Email(userName)'),
          CustomForm(
            formModel: FormFieldModel(
              validate: (data) {
                if (data!.isEmpty) {
                  return 'Please enter your email or userName';
                }
                return null;
              },
              left: 5,
              hintText: 'exapmle@gmail.com',
              controller: controller,
            ),
          ),
          CustomTextForm(title: 'Password'),
          CustomForm(
            formModel: FormFieldModel(
              validate: (data) {
                if (data!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              left: 5,
              hintText: 'Enter your Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscureText!,
              controller: controllerpassword,
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText!;
                  });
                },
                icon: Icon(
                  obscureText! ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),

          SizedBox(height: 35),
          PrimaryButton(
            title: 'Login',
            radius: 15,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                controller!.clear();
                controllerpassword!.clear();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeView()));
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {
                  
                });
              }
            
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: GestureDetector(
              onTap: () {
                //! ForgetPassWordPage
              },
              child: Text(
                'Forgot password ?',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Color(0xff2A6827),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
