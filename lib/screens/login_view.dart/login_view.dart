import 'package:flutter/material.dart';
import 'package:graduation_project/shared_widget.dart/component_login_or_register.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_title.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String selected = 'login';
  void updatePageTitle(String select) {
    setState(() {
      selected = select;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomAppTitle(selectedPage: selected),
            ComponentLoginOrRegister(onSwitch: updatePageTitle),
          ],
        ),
      ),
    );
  }
}
