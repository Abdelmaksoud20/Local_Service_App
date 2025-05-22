import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/models/auth_models/login_model.dart';
import 'package:graduation_project/models/form_field_model.dart';
import 'package:graduation_project/screens/register_view/service_provider/service_provider_home.dart';
import 'package:graduation_project/shared_widget.dart/custom_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

import '../../../services/auth_service.dart';
import '../../home_views/home_view.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {

  bool? obscureText = true;
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerpassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Future <void> loginUser() async {
    final LoginModel loginModel = LoginModel(
      email: controllerEmail!.text ,
      password: controllerpassword!.text ,
    );
    try {
      var res = await AuthService().login(loginModel);
      if(res["user"]["service"]== ""){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeView( response: res["user"]["id"],)));
      }else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ServiceProviderHome()));
      }
      print("${res["user"]["service"]}+++++++++++++++");
    }catch(e){
      print("${e.toString()}----------------------");

    }

  }


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
              controller: controllerEmail,
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
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                loginUser();
                  formKey.currentState!.save();
                  controllerEmail!.clear();
                  controllerpassword!.clear();
                } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
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
