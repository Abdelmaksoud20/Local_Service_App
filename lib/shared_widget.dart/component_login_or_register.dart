import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_view.dart/widgets/login_component.dart';
import 'package:graduation_project/screens/register_view/resigter_component.dart';
import 'package:graduation_project/shared_widget.dart/switch_login_and_signup.dart';
import 'package:graduation_project/helper/colors_app.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_body.dart';

class ComponentLoginOrRegister extends StatefulWidget {
  const ComponentLoginOrRegister({super.key, required this.onSwitch});
  final Function(String) onSwitch;
  @override
  State<ComponentLoginOrRegister> createState() =>
      _ComponentLoginOrRegisterState();
}

class _ComponentLoginOrRegisterState extends State<ComponentLoginOrRegister> {
  bool page = true;
  Color colorlogin = Colors.white;
  Color colorlRegister = ColorsApp.switchColor;
  @override
  Widget build(BuildContext context) {
    return CustomAppBody(
      child: SingleChildScrollView(
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchingLoginAndSignUp(
              onPressedlogin: () {
                page = true;
                colorlogin = Colors.white;
                colorlRegister = ColorsApp.switchColor;
                widget.onSwitch('login');
                setState(() {});
              },
              onPressedRegister: () {
                page = false;
                colorlogin = ColorsApp.switchColor;
                colorlRegister = Colors.white;
                widget.onSwitch('register');
                setState(() {});
              },
              loginColor: colorlogin,
              registerColor: colorlRegister,
            ),
            page  ? LoginComponent() : RegisterComponent(onSwitch: widget.onSwitch),
          ],
        ),
      ),
    );
  }
}
