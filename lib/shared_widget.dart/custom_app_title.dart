import 'package:flutter/material.dart';
import 'package:graduation_project/helper/app_style.dart';
import 'package:graduation_project/helper/colors_app.dart';

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
        child: Text(title!, style: AppStyle.fontBoldSize28),
      ),
    );
  }
}
