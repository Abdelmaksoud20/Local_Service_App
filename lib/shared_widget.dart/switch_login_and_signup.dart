import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_view.dart/login_view.dart';
import 'package:graduation_project/screens/register_view/register_view.dart';
import 'package:graduation_project/shared_widget.dart/custom_button_switch.dart';
import 'package:graduation_project/helper/colors_app.dart';

class SwitchingLoginAndSignUp extends StatelessWidget {
  const SwitchingLoginAndSignUp({
    super.key,
    required this.loginColor,
    required this.registerColor,
    this.paddingTop = 15,
    //  this.onPressedlogin,
    //  this.onPressedRegister,
  });
  final Color loginColor, registerColor;
  final double paddingTop;
  // final VoidCallback? onPressedlogin;
  // final VoidCallback? onPressedRegister;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: paddingTop),
      height: 65,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: ColorsApp.switchColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: CustomButtonSwitch(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              paddingLeft: 18,
              title: 'Login',
              color: loginColor,
              // onPressed: onPressedlogin,
            ),
          ),
          Expanded(
            child: CustomButtonSwitch(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
              paddingRight: 18,
              title: 'Register',
              color: registerColor,
              // onPressed: onPressedRegister,
            ),
          ),
        ],
      ),
    );
  }
}
