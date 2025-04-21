import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/helper/font_size.dart';

class CustomRequestButton extends StatelessWidget {
  const CustomRequestButton({
    super.key,
    required this.buttonTitle,
    required this.color,
  });
  final String buttonTitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        buttonTitle,
        style: GoogleFonts.poppins(
          fontSize: FontSizeApp.fontSize13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}