import 'package:flutter/material.dart';
import 'package:graduation_project/helper/colors_app.dart';
import 'package:graduation_project/screens/register_view/resigter_component.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_body.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_title.dart';
import 'package:graduation_project/shared_widget.dart/switch_login_and_signup.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // update
          child: Stack(
            children: [
              CustomAppTitle(title: "Don't Have an Account Yet?",),
              CustomAppBody(child: Column(
                children: [
                  SwitchingLoginAndSignUp(loginColor: ColorsApp.switchColor, registerColor: Colors.white,),
                  RegisterComponent(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}