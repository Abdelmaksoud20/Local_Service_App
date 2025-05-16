import 'package:flutter/material.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_title.dart';
import 'package:graduation_project/screens/login_view.dart/widgets/login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // update
          child: Stack(
            children: [
              CustomAppTitle(title: 'Sign in-up to enjoy the best service',),
              Login(),
            ],
          ),
        ),
      ),
    );
  }
}
