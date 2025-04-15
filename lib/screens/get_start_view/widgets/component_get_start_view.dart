import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/screens/login_view.dart/login_view.dart';
import 'package:graduation_project/helper/font_size.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_body.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

class ComponentGetStartView extends StatelessWidget {
  const ComponentGetStartView({super.key,});
  @override
  Widget build(BuildContext context) {
    return CustomAppBody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 2.7 / 3,
            child: Image.asset(kLogo, fit: BoxFit.fill),
          ),
          PrimaryButton(
            fontSize: FontSizeApp.fontSize32,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginView();
                  },
                ),
              );
            },
            title: 'Get Start',
          ),
        ],
      ),
    );
  }
}
