import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/helper/colors_app.dart';
import 'package:graduation_project/helper/font_size.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.radius = 10,  this.fontSize = FontSizeApp.fontSize28,
  });
  final String title;
  final VoidCallback? onPressed;
  final double radius;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 360,
        height: 65,
        decoration: BoxDecoration(
          color: ColorsApp.primarycolor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
