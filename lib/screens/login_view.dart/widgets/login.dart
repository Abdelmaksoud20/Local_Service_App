import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_view.dart/widgets/login_component.dart';
import 'package:graduation_project/shared_widget.dart/switch_login_and_signup.dart';
import 'package:graduation_project/helper/colors_app.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_body.dart';

class Login extends StatelessWidget {
  const Login({super.key, });

  @override
  Widget build(BuildContext context) {
    return CustomAppBody(
      child: SingleChildScrollView(
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchingLoginAndSignUp(
              loginColor: Colors.white,

              registerColor: ColorsApp.switchColor,
            ),
            LoginComponent(),
            // RegisterComponent(onSwitch: widget.onSwitch),
          ],
        ),
      ),
    );
  }
}
