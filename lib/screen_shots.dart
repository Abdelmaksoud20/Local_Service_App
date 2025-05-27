import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_view.dart/login_view.dart';
import 'package:graduation_project/shared_widget.dart/custom_app_body.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';
import 'constant.dart';
import 'helper/app_style.dart';
import 'helper/colors_app.dart';
import 'helper/font_size.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            CustomAppTitle(title: 'Service At Your Fingertios',),
            ComponentGetStartView(),
          ],
        ),
      ),
    );
  }
}
class CustomAppTitle extends StatelessWidget {
  const CustomAppTitle({super.key, this.paddingTop = 60, this.title});
  final String? title;
  final double paddingTop;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      color: ColorsApp.primarycolor,
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.06, left: width * 0.03),
        child: Text(
            title!,
            style: AppStyle.fontBoldSize28

        ),
      ),
    );
  }
}
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
