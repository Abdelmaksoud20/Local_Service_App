import 'package:flutter/material.dart';
import 'package:graduation_project/screens/register_view/client/client_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_body.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_title.dart';

class ClientRegister extends StatelessWidget {
  const ClientRegister({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // update
          child: Stack(
            children: [
              CustomAppTitle(title: "Sign in-up to enjoy the best service",),
              CustomAppBody(child: SingleChildScrollView(child: ClientForm())),
            ],
          ),
        ),
      ),
    );
  }
}
