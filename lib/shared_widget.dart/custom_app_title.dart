import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/helper/colors_app.dart';
import 'package:graduation_project/helper/font_size.dart';

class CustomAppTitle extends StatelessWidget {
  const CustomAppTitle({
    super.key,
     this.selectedPage,
    this.paddingTop = 60,
  });
  final String? selectedPage;
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
        padding: EdgeInsets.only(top: height * 0.05, left: width * 0.02),
        child: Text(
          text(selectedPage ?? ''),
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: FontSizeApp.fontSize28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  String text(String selectPage) {
    if (selectPage == 'login'  || selectPage == 'client') {
      return 'Sign in-up to enjoy the best service';
    } else if (selectPage == 'register') {
      return "Don't Have an Account Yet?";
    } else if (selectPage == 'serviceProvider') {
      return "Let's Create Creative Work";
    } else {
      return 'Service At Your Fingertios';
    }
  }
}
