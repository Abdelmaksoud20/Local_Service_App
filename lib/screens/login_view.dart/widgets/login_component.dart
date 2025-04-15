import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/shared_widget.dart/custom_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  bool? obscureText = true;
  TextEditingController? controller = TextEditingController();
  TextEditingController? controllerpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        CustomTextForm(title: 'Email'),
        CustomForm(hintText: 'expamle@gmail.com', controller: controller),
        CustomTextForm(title: 'Password'),
        CustomForm(
          controller: controllerpassword,
          obscureText: obscureText,
          hintText: 'Password',
          icon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText!;
              });
            },

            icon: Icon(obscureText! ? Icons.visibility : Icons.visibility_off),
          ),
        ),

        SizedBox(height: 35),
        PrimaryButton(
          title: 'Login',
          radius: 15,
          onPressed: () {
            controller!.clear();
            controllerpassword!.clear();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Text(
            'Forgot password',
            style: GoogleFonts.poppins(fontSize: 13, color: Color(0xff2A6827)),
            // TextStyle(color: Color(0xff2A6827), fontSize: 15),
          ),
        ),
      ],
    );
  }
}
