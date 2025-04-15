import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/helper/font_size.dart';

class CustomButtonSwitch extends StatelessWidget {
  const CustomButtonSwitch({
    super.key,
    required this.title,
    this.onPressed,
    required this.color,
    this.fontWeight = FontWeight.w500,  this.paddingLeft =0 ,  this.paddingRight=0,
  });
  final String title;
  final VoidCallback? onPressed;
  final Color color;
  final FontWeight? fontWeight;
  final double paddingLeft;
  final double paddingRight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:  EdgeInsets.only(left: paddingLeft, right: paddingRight),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: FontSizeApp.fontSize20,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
